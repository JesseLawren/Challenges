public with sharing class EliteChallenge2Controller {
    public List<Contact> conts {get; set;}
    
    public EliteChallenge2Controller(ApexPages.StandardController sdController) {
        Id accId = sdController.getId();
        System.debug('Account ID: ' + accId);
        conts = [SELECT FirstName, LastName, Email, Phone FROM Contact WHERE AccountID = :accId];
        System.debug('Contacts: ' + conts);
    }
}