trigger Challenge4 on Contact (after update) {

    Set<Id> accountIds = new Set<Id>();
    List<Account> accountsToUpdate = new List<Account>();
    
    // Loop through the Trigger.new list of updated Contacts
    for(Contact con : Trigger.new) {
        if(con.Phone != Trigger.oldMap.get(con.Id).Phone && con.AccountId != null) {
            accountIds.add(con.AccountId);
        }
    }
    
    // Query for Account records that need to be updated
    for(Account acc : [SELECT Id, Phone FROM Account WHERE Id IN :accountIds]) {
        Boolean shouldUpdate = true;

        for(Contact con : Trigger.new) {
            if(con.AccountId == acc.Id && (con.Phone != acc.Phone || con.Phone == null)) {
                shouldUpdate = false;
                break;
            }
        }
        
        if(shouldUpdate) {
            acc.Phone = Trigger.newMap.get(acc.Contacts[0].Id).Phone;
            accountsToUpdate.add(acc);
        }
    }
    
    // If there are any Account records to update, perform the update operation
    if(accountsToUpdate.size() > 0) {
        update accountsToUpdate;
    }
}
