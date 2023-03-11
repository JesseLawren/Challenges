trigger Challenge1 on Account (before delete) {
    // L:ist of all Account IDs to be deleted
    Set<Id> accountIds = new Set<Id>();
    for(Account acc : Trigger.old) {
        accountIds.add(acc.Id);
    }

    // Query for any Contacts that are related to the Accounts being deleted
    List<Contact> relatedContacts = [SELECT Id, AccountId FROM Contact WHERE AccountId IN :accountIds];

    // Prevent the deletion of the corresponding Accounts
    if(!relatedContacts.isEmpty()) {
        for(Account acc : Trigger.old) {
            if(accountIds.contains(acc.Id)) {
                acc.addError('Sorry! You cannot delete Accounts with related Contacts');
            }
        }
    }
}
