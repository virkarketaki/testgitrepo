global class FetchUserFromMailSubject implements Messaging.Inboundemailhandler
{
	global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope env)
	{
		Messaging.InboundEmailResult result = new Messaging.Inboundemailresult();
		String body = '';
		String fileName = '';
		
		if(email.TextAttachments != null)
		{
			body = email.TextAttachments[0].body;
			fileName = email.TextAttachments[0].fileName;
		}
		list<String> listStr = new list<String>();
		
		String subject = email.subject;
		system.debug('000000000000000000000'+subject);
		
		listStr = subject.splitByCharacterTypeCamelCase();
		system.debug('111111111111111111111'+listStr);
		
		list<User> listUser = [Select u.LastName, u.Id, u.FirstName From User u where u.isActive = true and (u.LastName IN :listStr OR u.FirstName IN :listStr)];
	//	list<User> listUser = [Select u.LastName, u.Id, u.FirstName From User u where (subject.contains(u.LastName) = true) OR (subject.contains(u.FirstName) = true)];
		system.debug('222222222222222222222'+listUser);
	
		try
		{
		
		list<Task> newTask = new list<Task>();
		for(User objUser : listUser)
		{
		newTask.add(new Task(Description =  email.plainTextBody,
           Priority = 'Normal',
           Status = 'Inbound Email',
           Subject = subject,
           IsReminderSet = true,
           ReminderDateTime = System.now(),
           OwnerId =  objUser.Id));
		}
    	insert newTask;
    	
    	for(Task objTask : newTask)
    	{
    	Attachment attach=new Attachment();  
      attach.Body=Blob.valueOf(body);  
      attach.Name=fileName;  
      attach.ParentID=objTask.id;
      insert attach;
    	}
    	
    	
    	Messaging.SingleEmailMessage mailToForward = new Messaging.SingleEmailMessage();
   			String[] toAddresses = new String[] {email.fromAddress};
	        mailToForward.setToAddresses(toAddresses);
    	    //mailToForward.setSenderDisplayName('Salesforce Support');
        /*	if(objProject != null)
				mailToForward.setSubject(email.subject.substringAfter(':'));
			else*/
				mailToForward.setSubject(email.subject);
			
        	mailToForward.setHtmlBody(email.htmlBody);
	        system.debug('3333333333333333333333 '+mailToForward);
			Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mailToForward });
    	
    	
		}
		catch(QueryException e) {
       System.debug('Query Issue: ' + e);
   }
		
		
		if(!listUser.isEmpty())
			result.success = true;
		else
			result.success = false;

		system.debug('*******************'+result);
		
		return result;
	}
}