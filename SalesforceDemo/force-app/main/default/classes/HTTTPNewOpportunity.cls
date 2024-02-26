@RestResource(urlMapping='/Opportunity')
global class HTTTPNewOpportunity {



    @HttpDelete
    global static String doDelete() {
       return 'Im not Going to do Delete Nothing Today '+ System.Today();
    }
  
    @HttpGet
    global static String doGet() {
       return 'Im  Going to give you Nothing Today '+ System.Today();
    }
  
  @HttpPost
    global static String doPost(wrapOpportunityWon newOpp){
           
    
        Id AccId = [SELECT ID FROM Account WHERE Phone =:newOpp.phone].Id;    
        Opportunity opp = new Opportunity();
        
             opp.AccountId = AccId;
        
             opp.Name='Opp of '+ newOpp.Name + +System.Today();

             opp.StageName='Closed Won';

             opp.CloseDate=Date.today();

             insert opp;  
        return  'The new Opportunity is '+URL.getOrgDomainURL() + '/' +  opp.Id;
        
    }
}