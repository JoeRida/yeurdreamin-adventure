public with sharing class YeurContactController {
    public YeurContactController() {

    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> contactList(){
        List<Contact> contactList = [Select Id, Name, FirstName, LastName, Email, 
                                    Phone, Title,
                                    Picture__c, Account.Name
                                    From Contact Where AccountId != null AND Email != null];
        return contactList;
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> searhContactByName(String contacName){
        String key = '%'+contacName+'%';
        List<Contact> contactList = new List<Contact>();
        contactList = [Select Id, Name, FirstName, LastName, Email, 
                                    Phone, Title,
                                    Picture__c, Account.Name
                                    From Contact Where AccountId != null AND Email != null
                                    AND Name like :key];
        return contactList;
    }
}