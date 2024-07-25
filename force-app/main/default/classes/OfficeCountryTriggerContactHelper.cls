public class OfficeCountryTriggerContactHelper {
   public static void InsertCountry(List<Contact> con){
        Set<Id> contactsIds = new Set<Id>();
            for (Contact c : con) {
                 contactsIds.add(c.AccountId);
             }
       
       Map<Id, Account> accountAmounts = new Map<Id, Account>([SELECT Id, Asgn_Office_Country__c FROM Account WHERE Id IN :contactsIds]);

       for(Contact cont : con){
           if(accountAmounts.containsKey(cont.AccountId)){
               cont.Asgn_Office_Country__c = accountAmounts.get(cont.AccountId).Asgn_Office_Country__c;              
           }
       }
    }
}