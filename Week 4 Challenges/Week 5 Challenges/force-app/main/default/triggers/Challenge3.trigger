trigger Challenge3 on Account (after insert) {
    List<Contact> contToInsert = new List<Contact>();
    for(Account acc : Trigger.new) {
        Contact newCont = new Contact();
        newCont.AccountId = acc.Id;
        newCont.FirstName = 'Jane';
        newCont.LastName = 'Doe';
        contToInsert.add(newCont);
    }
    insert contToInsert;
}
