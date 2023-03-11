public class DataLord {

//SOQL
    public Account NumAccounts(){
        System.debug([SELECT COUNT() FROM Account]);
    }

    public Account NumHot(){
        System.debug([SELECT COUNT() FROM Account WHERE Rating = 'Hot']);
    }

    public Account NumComplex(){
        System.debug([SELECT COUNT() FROM Account WHERE Name LIKE '%&%']);
    }

    public List<Account> BigFive(){
        System.debug([SELECT Name, AnnualRevenue FROM Account ORDER BY AnnualRevenue DESC LIMIT 5]);
    }

    public Opportunity LastBigOpportunity() {
        System.debug([SELECT Id, Name, Amount, CloseDate FROM Opportunity WHERE Amount > 100000 ORDER BY CloseDate DESC LIMIT 1]); 
    }
    
    public List<Contact> MajorPlayers() {
        System.debug([SELECT Id, Name, AccountId FROM Contact WHERE Account.Rating = 'Hot']);
    }

    public static String MostPopularAccount() {
        List<Account> accounts = [SELECT Id, Name, (SELECT Id FROM Contacts) FROM Account];
        Integer mxContactCount = 0;
        String mostPopularAccount = '';
    
        for(Account acc : accounts) {
            Integer contactCount = acc.Contacts.size();
    
            if(contactCount > maxContactCount) {
                maxContactCount = contactCount;
                mostPopularAccount = acc.Name;
            }
        }
    
        return mostPopularAccount;
    }

    
    
    


//SOSL
    public static List<SObject> searchForToms() {
        String searchQuery = 'FIND {Tom*} IN ALL FIELDS RETURNING Contact(Id, FirstName, LastName), Lead(Id, FirstName, LastName)';
        List<List<SObject>> searchResults = [FIND :searchQuery];

        List<SObject> toms = new List<SObject>();
        for(List<SObject> objects : searchResults) {
            toms.addAll(objects);
        }

        return toms;
    }

    public static List<Account> searchForAccounts() {
        String searchQuery = 'FIND {*a* *o*} IN ALL FIELDS RETURNING Account(Id, Name, BillingCity, BillingState)';
        List<List<SObject>> searchResults = [FIND :searchQuery];
    
        List<Account> accs = new List<Account>();
        for(SObject obj : searchResults[0]) {
            accs.add((Account)obj);
        }
    
        return accs;
    }
    
//DML 
    public static void SpawnContacts() {
        List<Contact> newContacts = new List<Contact>();
        
        for(Integer i=0; i<200; i++) {
            Contact con = new Contact();
            con.FirstName = 'Contact' + i;
            con.LastName = 'Test';
            newContacts.add(con);
        }
        
        insert newContacts;
    }

    public static void CreateHomes() {
        List<Account> newAccs = new List<Account>();
        
        for(Integer i=1; i<=3; i++) {
            Account acc = new Account();
            acc.Name = 'Home ' + i;
            newAccs.add(acc);
        }
        
        insert newAccs;
    }
    
    public static void Relocate() {
        List<Contact> contactsToDelete = [SELECT Id, Name FROM Contact ORDER BY CreatedDate DESC LIMIT 50];
        
        delete contactsToDelete;
    }
    
    public static void AssignHomes() {
        List<Account> homeAccs = [SELECT Id FROM Account WHERE Name LIKE 'Home %' LIMIT 3];
        List<Contact> challengeCont = [SELECT Id, AccountId FROM Contact WHERE CreatedDate >= LAST_N_DAYS:7 AND LastName = 'Test'];
        
        for(Contact con : challengeContacts) {
            con.AccountId = homeAccs[Math.mod(Math.abs(con.Name.hashCode()), 3)].Id;
        }

        update challengeCont;
    }
    


    
}