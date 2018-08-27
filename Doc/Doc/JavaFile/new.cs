  public void actionPerformed(ActionEvent paramActionEvent) 
    { 
   
//btnCollectData--Get_CollectTicket
        if ((paramActionEvent.getSource() == btnCollectData))
        {
            String str1 = txtWayData.getText();
            str1 = str1.replaceAll("$", "");
            if ((str1.length() >= 82)) 
             {
                 btnCollectData.setEnabled(false);
                 setCursor(busyCursor);
                 insertSmsContent(etmNumberValue, "Download Ticket");
                 commandString = ticketData;
                 txtData.setText("");
                 txtTotalCollection.setText("");
                 txtCashCollected.setText("");
                 txtAmtDifference.setText("");
                 txtTotalTopupCollection.setText("");
                 txtTotalTicketCollection.setText("");
                 dataType = "Ticket";
                 try 
                 {
                     connect();
                     if ((initIOStream() == true)) 
                     {
                         initListener();
                         int k = ((char)(dollarData));
                         output.write(k);
                     }            
                     setCursor(defaultCursor);
                 }
                 catch (Exception localException6) 
                 {         
                 }
            }    
            else
            {
            JOptionPane.showMessageDialog(this, "Please collect the waybill first...", "Error", 0);
            }   
   
   
//btnWayBill
        else if ((paramActionEvent.getSource() == btnWayBill))
        {
            commandString = wayBillData;
            txtData.setText("");
            txtWayData.setText("");
            txtSmartCardData.setText("");
            txtTotalCollection.setText("");
            txtCashCollected.setText("");
            txtAmtDifference.setText("");
            txtTotalTopupCollection.setText("");
            txtTotalTicketCollection.setText("");
            btnUploadData.setEnabled(false);
            btnGetCardTopUp.setEnabled(false);
            btnUploadCardData.setEnabled(false);
            btnCollectCash.setEnabled(false);
            dataType = "WayBill";
            try
            {
                connect();
                if ((initIOStream() == true)) 
                {
                    initListener();
                    int i = ((char)(dollarData));
                    output.write(i);
                }
                
            }
            catch (Exception localException1)
            {
                
            }
            
        }