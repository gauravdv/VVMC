

import java.awt.Container;
import java.awt.Font;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;
import java.io.OutputStream;
import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Date;
import javax.comm.CommPortIdentifier;
import javax.comm.SerialPort;
import javax.swing.JApplet;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JMenu;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.event.DocumentEvent;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;
import javax.swing.table.TableColumnModel;
import javax.swing.table.TableModel;
import javax.swing.text.Document;

public class DataVoice extends JApplet implements java.awt.event.ActionListener, javax.comm.SerialPortEventListener, javax.swing.event.TableModelListener, java.awt.event.KeyListener
{
  JComboBox cmbPortList;
  JComboBox cmbConductor;
  JLabel lblHeader;
  JLabel lblSerialPort;
  JLabel lblWayBill;
  JLabel lblTicket;
  JLabel lblSmartCard;
  JLabel lblCollectionDate;
  JLabel lblConductor;
  JLabel lblCouponCollectiondate;
  JLabel lblTotalTicketCollection;
  JLabel lblTotalTopUpCollection;
  JLabel lblTotalCollection;
  JLabel lblTotalCollectionAmt;
  JLabel lblTotalCouponData;
  JButton btnCollectData;
  JButton btnWayBill;
  JButton btnUploadData;
  JButton btnDelWayBill;
  JButton btnEraseData;
  JButton btnWayBillNumber;
  JButton btnUploadWayBill;
  JButton btnCollectCash;
  JButton btnGetTotalAmount;
  JButton btnCauculateAmount;
  JButton btnGetConductorCoupon;
  JButton btnUploadCouponData;
  JButton btnGetCouponAmount;
  JButton btnGetCardTopUp;
  JButton btnUploadCardData;
  JButton btnCouponCollectCash;
  JTextField txtWayBillNo;
  JTextField txtCashCollDate;
  JTextField txtCashCollected;
  JTextField txtCouponCollectDate;
  JTextField txtTotalTicketCollection;
  JTextField txtTotalTopupCollection;
  JTextField txtTotalCollection;
  JTextField txtTotalCouponCollection;
  javax.swing.JProgressBar progressBar;
  JTextArea txtData;
  public static JTextArea txtWayData = new JTextArea(3, 75);
  
  JTextArea txtSmartCardData;
  
  javax.swing.JMenuBar menuBar;
  
  JMenu menuAuditing;
  
  JMenu menuMasters;
  
  JMenuItem menuItemCollection;
  
  JMenuItem menuItemCreateWaybill;
  
  JMenuItem menuItemCouponTicket;
  
  JPanel panelAuditing;
  
  JPanel panelWaybillTicket;
  
  JPanel panelButton;
  
  JPanel panelMain;
  
  JPanel panelHeader;
  
  JPanel panelProgress;
  
  JPanel panelFrontPage;
  
  JPanel panelHeaderAll;
  
  JPanel panelCreateWaybill;
  
  JPanel panelDisplayCont;
  
  JPanel panelGetWayBill;
  
  JPanel panelWayBillUpload;
  
  JPanel panelCashCollection;
  
  JPanel panelGetCash;
  
  JPanel panelCashDate;
  
  JPanel panelCashDisp;
  JPanel panelCoupon1;
  JPanel panelCoupon2;
  JPanel panelCoupon3;
  JPanel panelCouponButton;
  JPanel panelTicketCollection;
  JLabel lblParticulars;
  JLabel lblCount;
  JLabel lblAmount;
  JLabel lblP1000;
  JLabel lblP500;
  JLabel lblP100;
  JLabel lblP50;
  JLabel lblP20;
  JLabel lblP10;
  JLabel lblP5;
  JLabel lblP2;
  JLabel lblP1;
  JLabel lblPS10;
  JLabel lblPS5;
  JLabel lblPS2;
  JLabel lblPS1;
  JLabel lblPS50;
  JLabel lblDivisionCoins;
  JLabel lblToTalAmtCol;
  JLabel lblAmtDifference;
  JTextField txtAmtDifference;
  JTextField txtPC1000;
  JTextField txtPC1500;
  JTextField txtPC100;
  JTextField txtPC50;
  JTextField txtPC20;
  JTextField txtPC10;
  JTextField txtPC5;
  JTextField txtPC2;
  JTextField txtPC1;
  JTextField txtPCs10;
  JTextField txtPCs5;
  JTextField txtPCs2;
  JTextField txtPCs1;
  JTextField txtPCs05;
  JTextField txtPA1000;
  JTextField txtPA1500;
  JTextField txtPA100;
  JTextField txtPA50;
  JTextField txtPA20;
  JTextField txtPA10;
  JTextField txtPA5;
  JTextField txtPA2;
  JTextField txtPA1;
  JTextField txtPCsA10;
  JTextField txtPCsA5;
  JTextField txtPCsA2;
  JTextField txtPCsA1;
  JTextField txtPCsA05;
  JTextField txtTotalAmtCol;
  JTable tblWayBillDetails;
  JTable tblCashCollection;
  JTable tblConductorCoupon;
  DefaultTableModel model;
  DefaultTableModel couponModel;
  static CommPortIdentifier portId;
  static java.util.Enumeration portList;
  public static Connection db = null;
  
  public static java.sql.Statement sql;
  public static java.sql.DatabaseMetaData dbmd;
  public static String database = "db_vvmt_010413";
  public static String username = "root";
  public static String password = "p@ssw0rd321#";
  public static String server = "85.25.117.20";
  
  public static String conCatenateWayBill;
  
  public static SerialPort serialPort;
  
  public static javax.comm.CommPort commPort;
  
  public static int sessId;
  
  private java.io.InputStream input;
  
  private OutputStream output;
  public static String machineType = "";
  
  String logText;
  
  String concatDeviceData;
  
  String[] columnHeader;
  
  String cashCollected;
  String conductorName;
  public static java.awt.Cursor busyCursor = java.awt.Cursor.getPredefinedCursor(3);
  public static java.awt.Cursor defaultCursor = java.awt.Cursor.getDefaultCursor();
  static final int NEW_LINE_ASCII = 10;
  int dollarData;
  int ticketData;
  int wayBillData;
  int ticketEraseData;
  int tcketEraseData1;
  int wayBillEraseData;
  int wayBillUpload;
  int cardTopUp;
  int endOfString;
  String taxFactor;
  String etmNumberValue;
  String dataType;
  int commandString;
  int chkWayBillSend;
  
  public DataVoice()
  {
    cmbPortList = new JComboBox();
    cmbConductor = new JComboBox();
    
    lblHeader = new JLabel("Vasai-Virar Muncipal Transport (VVMT)");
    lblSerialPort = new JLabel("Select Serial Port");
    lblWayBill = new JLabel("WayBill");
    lblTicket = new JLabel("Ticket");
    lblSmartCard = new JLabel("Smart Card");
    

    lblCollectionDate = new JLabel("Collection Date");
    lblConductor = new JLabel("Select Conductor");
    lblCouponCollectiondate = new JLabel("Date");
    lblTotalTicketCollection = new JLabel("Total Ticket Collection");
    lblTotalTopUpCollection = new JLabel("Total Topup Collection");
    lblTotalCollection = new JLabel("Total Collection");
    lblTotalCollectionAmt = new JLabel("Total Collection");
    lblTotalCouponData = new JLabel("Total Ticket Amount");
    
    btnCollectData = new JButton("Collect Ticket");
    btnWayBill = new JButton("Collect WayBill");
    btnUploadData = new JButton("Upload Ticket");
    btnDelWayBill = new JButton("Delete Waybill");
    btnEraseData = new JButton("Erase Ticket");
    btnWayBillNumber = new JButton("Get Waybill");
    btnUploadWayBill = new JButton("Upload Waybill");
    btnCollectCash = new JButton("Collect Cash");
    btnGetTotalAmount = new JButton("Get Total Amount");
    btnCauculateAmount = new JButton("Upload Collection");
    btnGetConductorCoupon = new JButton("Get Conductor Ticket Details");
    btnUploadCouponData = new JButton("Upload Ticket Data");
    btnGetCouponAmount = new JButton("Get No. of Tickets");
    btnGetCardTopUp = new JButton("Collect Card Data");
    btnUploadCardData = new JButton("Upload Card Data");
    btnCouponCollectCash = new JButton("Collect Cash");
    
    txtWayBillNo = new JTextField(10);
    txtCashCollDate = new JTextField(10);
    txtCashCollected = new JTextField(10);
    txtCouponCollectDate = new JTextField(10);
    txtTotalTicketCollection = new JTextField(10);
    txtTotalTopupCollection = new JTextField(10);
    txtTotalCollection = new JTextField(10);
    txtTotalCouponCollection = new JTextField(10);
    

    progressBar = new javax.swing.JProgressBar();
    
    txtData = new JTextArea(5, 75);
    
    txtSmartCardData = new JTextArea(2, 75);
    
    menuBar = new javax.swing.JMenuBar();
    menuAuditing = new JMenu("Auditing");
    menuMasters = new JMenu("Masters");
    
    menuItemCollection = new JMenuItem("ETIM Ticket");
    menuItemCreateWaybill = new JMenuItem("Waybill Creation");
    menuItemCouponTicket = new JMenuItem("Ticket Collection");
    

    panelAuditing = new JPanel(new GridBagLayout());
    panelWaybillTicket = new JPanel(new GridBagLayout());
    panelButton = new JPanel(new GridBagLayout());
    panelMain = new JPanel(new GridBagLayout());
    panelHeader = new JPanel(new GridBagLayout());
    panelProgress = new JPanel(new GridBagLayout());
    panelFrontPage = new JPanel(new GridBagLayout());
    panelHeaderAll = new JPanel(new GridBagLayout());
    panelCreateWaybill = new JPanel(new GridBagLayout());
    panelDisplayCont = new JPanel(new GridBagLayout());
    panelGetWayBill = new JPanel(new GridBagLayout());
    panelWayBillUpload = new JPanel(new GridBagLayout());
    panelCashCollection = new JPanel(new GridBagLayout());
    panelGetCash = new JPanel(new GridBagLayout());
    panelCashDate = new JPanel(new GridBagLayout());
    panelCashDisp = new JPanel(new GridBagLayout());
    panelCoupon1 = new JPanel(new GridBagLayout());
    panelCoupon2 = new JPanel(new GridBagLayout());
    panelCoupon3 = new JPanel(new GridBagLayout());
    panelCouponButton = new JPanel(new GridBagLayout());
    panelTicketCollection = new JPanel(new GridBagLayout());
    

    lblParticulars = new JLabel("Particulars");
    lblCount = new JLabel("Count");
    lblAmount = new JLabel("Amount");
    lblP1000 = new JLabel("1000 x");
    lblP500 = new JLabel("500 x");
    lblP100 = new JLabel("100 x");
    lblP50 = new JLabel("50 x");
    lblP20 = new JLabel("20 x");
    lblP10 = new JLabel("10 x");
    lblP5 = new JLabel("5 x");
    lblP2 = new JLabel("2 x");
    lblP1 = new JLabel("1 x");
    
    lblPS10 = new JLabel("10 x");
    lblPS5 = new JLabel("5 x");
    lblPS2 = new JLabel("2 x");
    lblPS1 = new JLabel("1 x");
    lblPS50 = new JLabel("0.5 x");
    
    lblDivisionCoins = new JLabel("Coins");
    
    lblToTalAmtCol = new JLabel("Total Amount Collected");
    lblAmtDifference = new JLabel("Difference");
    
    txtAmtDifference = new JTextField(10);
    
    txtPC1000 = new JTextField(5);
    txtPC1500 = new JTextField(5);
    txtPC100 = new JTextField(5);
    txtPC50 = new JTextField(5);
    txtPC20 = new JTextField(5);
    txtPC10 = new JTextField(5);
    txtPC5 = new JTextField(5);
    txtPC2 = new JTextField(5);
    txtPC1 = new JTextField(5);
    
    txtPCs10 = new JTextField(5);
    txtPCs5 = new JTextField(5);
    txtPCs2 = new JTextField(5);
    txtPCs1 = new JTextField(5);
    txtPCs05 = new JTextField(5);
    
    txtPA1000 = new JTextField(5);
    txtPA1500 = new JTextField(5);
    txtPA100 = new JTextField(5);
    txtPA50 = new JTextField(5);
    txtPA20 = new JTextField(5);
    txtPA10 = new JTextField(5);
    txtPA5 = new JTextField(5);
    txtPA2 = new JTextField(5);
    txtPA1 = new JTextField(5);
    
    txtPCsA10 = new JTextField(5);
    txtPCsA5 = new JTextField(5);
    txtPCsA2 = new JTextField(5);
    txtPCsA1 = new JTextField(5);
    txtPCsA05 = new JTextField(5);
    
    txtTotalAmtCol = new JTextField(5);
    
    input = null;
    output = null;
    



    logText = "";
    concatDeviceData = "";
    columnHeader = new String[] { "WayBill No", "Conductor", "Driver", "Vehicle", "ETM NO", "Division", "Depot Name", "Depot Code", "Schedule" };
    cashCollected = "";
    conductorName = "";
    
    dollarData = 36;
    ticketData = 68;
    wayBillData = 66;
    ticketEraseData = 69;
    tcketEraseData1 = 46;
    wayBillEraseData = 67;
    wayBillUpload = 65;
    cardTopUp = 78;
    endOfString = 4;
    taxFactor = "00.15";
    etmNumberValue = "";
    
    dataType = "";
    
    commandString = 0;
    chkWayBillSend = 0;
  }
  

  public void init()
  {
    System.setSecurityManager(null);
    portList = CommPortIdentifier.getPortIdentifiers();
    sessId =12398; //Integer.parseInt(getParameter("sessionId"));
     System.out.print(portList);
     System.out.print(portList.hasMoreElements());
     
    while (portList.hasMoreElements())
    {
        System.out.print("in while");
     
      portId = (CommPortIdentifier)portList.nextElement();
         System.out.print(portId.getPortType());
      if (portId.getPortType() == 1)
      {
        cmbPortList.addItem(portId.getName());
        System.out.println(portId.getName());
      }
    }
    
    menuBar.add(menuAuditing);
    menuBar.add(menuMasters);
    menuAuditing.add(menuItemCollection);
    menuMasters.add(menuItemCreateWaybill);
    menuMasters.add(menuItemCouponTicket);
    menuItemCollection.addActionListener(new DataVoice.MenuAction());
    menuItemCreateWaybill.addActionListener(new DataVoice.MenuAction());
    menuItemCouponTicket.addActionListener(new DataVoice.MenuAction());
    setJMenuBar(menuBar);
    

    tblWayBillDetails = new JTable();
    tblWayBillDetails.setFillsViewportHeight(false);
    tblWayBillDetails.setAutoCreateRowSorter(true);
    tblWayBillDetails.setSelectionMode(0);
    tblWayBillDetails.setCellSelectionEnabled(false);
    tblWayBillDetails.setRowSelectionAllowed(true);
    tblWayBillDetails.setAutoResizeMode(0);
    JScrollPane localJScrollPane1 = new JScrollPane(tblWayBillDetails);
    localJScrollPane1.setPreferredSize(new java.awt.Dimension(800, 300));
    

    String[] arrayOfString = { "Particulars", "Count", "Amount" };
    String[][] arrayOfString1 = { { "1000 x", "0", "0" }, { "500 x", "0", "0" }, { "100 x", "0", "0" }, { "50 x", "0", "0" }, { "20 x", "0", "0" }, { "10 x", "0", "0" }, { "5 x", "0", "0" }, { "2 x", "0", "0" }, { "1 x", "0", "0" }, { "50 x", "0", "0" }, { "Total", "0", "0" } };
    
    tblCashCollection = new JTable(arrayOfString1, arrayOfString);
    javax.swing.table.JTableHeader localJTableHeader = tblCashCollection.getTableHeader();
    localJTableHeader.setBackground(java.awt.Color.yellow);
    
    JScrollPane localJScrollPane2 = new JScrollPane(tblCashCollection);
    localJScrollPane2.setPreferredSize(new java.awt.Dimension(300, 300));
    


    tblConductorCoupon = new JTable();
    tblConductorCoupon.setFillsViewportHeight(false);
    tblConductorCoupon.setAutoCreateRowSorter(true);
    tblConductorCoupon.setSelectionMode(0);
    tblConductorCoupon.setCellSelectionEnabled(false);
    tblConductorCoupon.setRowSelectionAllowed(true);
    tblConductorCoupon.setAutoResizeMode(0);
    JScrollPane localJScrollPane3 = new JScrollPane(tblConductorCoupon);
    localJScrollPane3.setPreferredSize(new java.awt.Dimension(750, 300));
    tblConductorCoupon.setCellSelectionEnabled(true);
    couponModel = new DefaultTableModel();
    tblConductorCoupon.setModel(couponModel);
    tblConductorCoupon.getModel().addTableModelListener(this);
    


    GridBagConstraints localGridBagConstraints1 = new GridBagConstraints();
      Insets insets = new Insets(5, 5, 5, 5);
    
      int gridx = 0;
      int gridy = 0;
    panelCoupon1.add(cmbConductor, localGridBagConstraints1);
    
    gridx = 0;
    gridy = 1;
    panelCoupon1.add(txtCouponCollectDate, localGridBagConstraints1);
    
    gridx = 0;
    gridy = 2;
    panelCoupon1.add(btnGetConductorCoupon, localGridBagConstraints1);
    
    gridx = 0;
    gridy = 3;
    panelCoupon1.add(localJScrollPane3, localGridBagConstraints1);
    
    GridBagConstraints localGridBagConstraints2 = new GridBagConstraints();
    insets = new Insets(5, 5, 5, 5);
    
    gridx = 0;
    gridy = 0;
    panelCouponButton.add(lblTotalCouponData, localGridBagConstraints2);
    
    gridx = 1;
    gridy = 0;
    panelCouponButton.add(txtTotalCouponCollection, localGridBagConstraints2);
    
    gridx = 1;
    gridy = 1;
    panelCouponButton.add(btnUploadCouponData, localGridBagConstraints2);
    
    gridx = 2;
    gridy = 1;
    panelCouponButton.add(btnCouponCollectCash, localGridBagConstraints2);
    
    GridBagConstraints localGridBagConstraints3 = new GridBagConstraints();
    insets = new Insets(5, 5, 5, 5);
    
    gridx = 0;
    gridy = 0;
    panelCoupon2.add(panelCoupon1, localGridBagConstraints3);
    
    gridx = 0;
    gridy = 1;
    panelCoupon2.add(panelCouponButton, localGridBagConstraints3);
    
    GridBagConstraints localGridBagConstraints4 = new GridBagConstraints();
    insets = new Insets(5, 5, 5, 5);
    gridx = 0;
    gridy = 0;
    panelHeader.add(lblHeader, localGridBagConstraints4);
    
    GridBagConstraints localGridBagConstraints5 = new GridBagConstraints();
    insets = new Insets(5, 5, 5, 5);
    gridx = 0;
    gridy = 0;
    panelAuditing.add(lblSerialPort, localGridBagConstraints5);
    
    gridx = 1;
    gridy = 0;
    panelAuditing.add(cmbPortList, localGridBagConstraints5);
    
    GridBagConstraints localGridBagConstraints6 = new GridBagConstraints();
     insets = new Insets(5, 5, 5, 5);
     gridx = 0;
     gridy = 1;
    panelWaybillTicket.add(lblWayBill, localGridBagConstraints6);
    
    JScrollPane localJScrollPane4 = new JScrollPane(txtWayData);
    
     gridx = 1;
     gridy = 1;
    panelWaybillTicket.add(localJScrollPane4, localGridBagConstraints6);
    
     gridx = 0;
     gridy = 2;
    panelWaybillTicket.add(lblTicket, localGridBagConstraints6);
    
     gridx = 0;
     gridy = 3;
    panelWaybillTicket.add(lblSmartCard, localGridBagConstraints6);
    

    JScrollPane localJScrollPane5 = new JScrollPane(txtData);
    
     gridx = 1;
     gridy = 2;
     panelWaybillTicket.add(localJScrollPane5, localGridBagConstraints6);
    
    JScrollPane localJScrollPane6 = new JScrollPane(txtSmartCardData);
    
     gridx = 1;
     gridy = 3;
    panelWaybillTicket.add(localJScrollPane6, localGridBagConstraints6);
    
    GridBagConstraints localGridBagConstraints7 = new GridBagConstraints();
     insets = new Insets(5, 5, 5, 5);
    
     gridx = 0;
     gridy = 0;
    panelTicketCollection.add(lblTotalTicketCollection, localGridBagConstraints7);
    
     gridx = 1;
     gridy = 0;
    panelTicketCollection.add(txtTotalTicketCollection, localGridBagConstraints7);
    
     gridx = 0;
     gridy = 1;
     panelTicketCollection.add(lblTotalTopUpCollection, localGridBagConstraints7);
    
     gridx = 1;
     gridy = 1;
    panelTicketCollection.add(txtTotalTopupCollection, localGridBagConstraints7);
    
     gridx = 0;
     gridy = 2;
    panelTicketCollection.add(lblTotalCollection, localGridBagConstraints7);
    
     gridx = 1;
     gridy = 2;
    panelTicketCollection.add(txtTotalCollection, localGridBagConstraints7);
    


    GridBagConstraints localGridBagConstraints8 = new GridBagConstraints();
     insets = new Insets(3, 3, 3, 3);
     gridx = 0;
     gridy = 0;
    panelButton.add(btnWayBill, localGridBagConstraints8);
    
     gridx = 1;
     gridy = 0;
    panelButton.add(btnCollectData, localGridBagConstraints8);
    btnCollectData.setEnabled(false);
    
     gridx = 2;
     gridy = 0;
    panelButton.add(btnUploadData, localGridBagConstraints8);
    btnUploadData.setEnabled(false);
    
     gridx = 3;
     gridy = 0;
    panelButton.add(btnGetCardTopUp, localGridBagConstraints8);
    btnGetCardTopUp.setEnabled(false);
    
     gridx = 4;
     gridy = 0;
     panelButton.add(btnUploadCardData, localGridBagConstraints8);
    btnUploadCardData.setEnabled(false);
    
    gridx = 5;
    gridy = 0;
    panelButton.add(btnCollectCash, localGridBagConstraints8);
    btnCollectCash.setEnabled(false);
    
    gridx = 6;
    gridy = 0;
    panelButton.add(btnEraseData, localGridBagConstraints8);
    
    gridx = 7;
    gridy = 0;
    panelButton.add(btnDelWayBill, localGridBagConstraints8);
    

    GridBagConstraints localGridBagConstraints9 = new GridBagConstraints();
    insets = new Insets(10, 10, 10, 10);
    gridx = 0;
    gridy = 0;
    panelProgress.add(progressBar, localGridBagConstraints9);
    



    GridBagConstraints localGridBagConstraints10 = new GridBagConstraints();
    insets = new Insets(5, 5, 5, 5);
    gridx = 0;
    gridy = 0;
    panelHeaderAll.add(panelHeader, localGridBagConstraints10);
    
    gridx = 0;
    gridy = 1;
    panelHeaderAll.add(panelAuditing, localGridBagConstraints10);
    


    GridBagConstraints localGridBagConstraints11 = new GridBagConstraints();
    insets = new Insets(10, 10, 10, 10);
    gridx = 0;
    gridy = 0;
    panelGetWayBill.add(txtWayBillNo, localGridBagConstraints11);
    
    gridx = 1;
    gridy = 0;
    panelGetWayBill.add(btnWayBillNumber, localGridBagConstraints11);
    
    GridBagConstraints localGridBagConstraints12 = new GridBagConstraints();
    insets = new Insets(10, 10, 10, 10);
    gridx = 0;
    gridy = 0;
    panelWayBillUpload.add(btnUploadWayBill, localGridBagConstraints12);
    

    GridBagConstraints localGridBagConstraints13 = new GridBagConstraints();
    insets = new Insets(0, 0, 0, 0);
    




    gridx = 0;
    gridy = 2;
    panelCreateWaybill.add(panelGetWayBill, localGridBagConstraints13);
    
    gridx = 0;
    gridy = 3;
    panelCreateWaybill.add(localJScrollPane1, localGridBagConstraints13);
    
    gridx = 0;
    gridy = 4;
    panelCreateWaybill.add(panelWayBillUpload, localGridBagConstraints13);
    

    GridBagConstraints localGridBagConstraints14 = new GridBagConstraints();
    insets = new Insets(2, 2, 2, 2);
    gridx = 0;
    gridy = 0;
    panelCashDisp.add(lblParticulars, localGridBagConstraints14);
    
    gridx = 1;
    gridy = 0;
    panelCashDisp.add(lblCount, localGridBagConstraints14);
    
    gridx = 2;
    gridy = 0;
    panelCashDisp.add(lblAmount, localGridBagConstraints14);
    
    gridx = 0;
    gridy = 1;
    panelCashDisp.add(lblP1000, localGridBagConstraints14);
    
    gridx = 1;
    gridy = 1;
    panelCashDisp.add(txtPC1000, localGridBagConstraints14);
    
    txtPC1000.getDocument().addDocumentListener(new DataVoice.MyDocumentListener());
    txtPC1000.getDocument().putProperty("name", "txtPC1000");
    txtPC1000.addKeyListener(this);
    
    gridx = 2;
    gridy = 1;
    panelCashDisp.add(txtPA1000, localGridBagConstraints14);
    
    gridx = 0;
    gridy = 2;
    panelCashDisp.add(lblP500, localGridBagConstraints14);
    
    gridx = 1;
    gridy = 2;
    panelCashDisp.add(txtPC1500, localGridBagConstraints14);
    txtPC1500.getDocument().addDocumentListener(new DataVoice.MyDocumentListener());
    txtPC1500.getDocument().putProperty("name", "txtPC1500");
    txtPC1500.addKeyListener(this);
    
    gridx = 2;
    gridy = 2;
    panelCashDisp.add(txtPA1500, localGridBagConstraints14);
    
    gridx = 0;
    gridy = 3;
    panelCashDisp.add(lblP100, localGridBagConstraints14);
    
    gridx = 1;
    gridy = 3;
    panelCashDisp.add(txtPC100, localGridBagConstraints14);
    txtPC100.getDocument().addDocumentListener(new DataVoice.MyDocumentListener());
    txtPC100.getDocument().putProperty("name", "txtPC100");
    txtPC100.addKeyListener(this);
    
    gridx = 2;
    gridy = 3;
    panelCashDisp.add(txtPA100, localGridBagConstraints14);
    
    gridx = 0;
    gridy = 4;
    panelCashDisp.add(lblP50, localGridBagConstraints14);
    
    gridx = 1;
    gridy = 4;
    panelCashDisp.add(txtPC50, localGridBagConstraints14);
    txtPC50.getDocument().addDocumentListener(new DataVoice.MyDocumentListener());
    txtPC50.getDocument().putProperty("name", "txtPC50");
    txtPC50.addKeyListener(this);
    
    gridx = 2;
    gridy = 4;
    panelCashDisp.add(txtPA50, localGridBagConstraints14);
    
    gridx = 0;
    gridy = 5;
    panelCashDisp.add(lblP20, localGridBagConstraints14);
    
    gridx = 1;
    gridy = 5;
    panelCashDisp.add(txtPC20, localGridBagConstraints14);
    txtPC20.getDocument().addDocumentListener(new DataVoice.MyDocumentListener());
    txtPC20.getDocument().putProperty("name", "txtPC20");
    txtPC20.addKeyListener(this);
    
    gridx = 2;
    gridy = 5;
    panelCashDisp.add(txtPA20, localGridBagConstraints14);
    
    gridx = 0;
    gridy = 6;
    panelCashDisp.add(lblP10, localGridBagConstraints14);
    
    gridx = 1;
    gridy = 6;
    panelCashDisp.add(txtPC10, localGridBagConstraints14);
    txtPC10.getDocument().addDocumentListener(new DataVoice.MyDocumentListener());
    txtPC10.getDocument().putProperty("name", "txtPC10");
    txtPC10.addKeyListener(this);
    
    gridx = 2;
    gridy = 6;
    panelCashDisp.add(txtPA10, localGridBagConstraints14);
    
    gridx = 0;
    gridy = 7;
    panelCashDisp.add(lblP5, localGridBagConstraints14);
    
    gridx = 1;
    gridy = 7;
    panelCashDisp.add(txtPC5, localGridBagConstraints14);
    txtPC5.getDocument().addDocumentListener(new DataVoice.MyDocumentListener());
    txtPC5.getDocument().putProperty("name", "txtPC5");
    txtPC5.addKeyListener(this);
    
    gridx = 2;
    gridy = 7;
    panelCashDisp.add(txtPA5, localGridBagConstraints14);
    
    gridx = 0;
    gridy = 8;
    panelCashDisp.add(lblP2, localGridBagConstraints14);
    
    gridx = 1;
    gridy = 8;
    panelCashDisp.add(txtPC2, localGridBagConstraints14);
    txtPC2.getDocument().addDocumentListener(new DataVoice.MyDocumentListener());
    txtPC2.getDocument().putProperty("name", "txtPC2");
    txtPC2.addKeyListener(this);
    
    gridx = 2;
    gridy = 8;
    panelCashDisp.add(txtPA2, localGridBagConstraints14);
    
    gridx = 0;
    gridy = 9;
    panelCashDisp.add(lblP1, localGridBagConstraints14);
    
    gridx = 1;
    gridy = 9;
    panelCashDisp.add(txtPC1, localGridBagConstraints14);
    txtPC1.getDocument().addDocumentListener(new DataVoice.MyDocumentListener());
    txtPC1.getDocument().putProperty("name", "txtPC1");
    txtPC1.addKeyListener(this);
    
    gridx = 2;
    gridy = 9;
    panelCashDisp.add(txtPA1, localGridBagConstraints14);
    


    gridx = 1;
    gridy = 10;
    panelCashDisp.add(lblDivisionCoins, localGridBagConstraints14);
    
    gridx = 0;
    gridy = 11;
    panelCashDisp.add(lblPS10, localGridBagConstraints14);
    
    gridx = 1;
    gridy = 11;
    panelCashDisp.add(txtPCs10, localGridBagConstraints14);
    txtPCs10.getDocument().addDocumentListener(new DataVoice.MyDocumentListener());
    txtPCs10.getDocument().putProperty("name", "txtPCs10");
    txtPCs10.addKeyListener(this);
    

    gridx = 2;
    gridy = 11;
    panelCashDisp.add(txtPCsA10, localGridBagConstraints14);
    
    gridx = 0;
    gridy = 12;
    panelCashDisp.add(lblPS5, localGridBagConstraints14);
    
    gridx = 1;
    gridy = 12;
    panelCashDisp.add(txtPCs5, localGridBagConstraints14);
    txtPCs5.getDocument().addDocumentListener(new DataVoice.MyDocumentListener());
    txtPCs5.getDocument().putProperty("name", "txtPCs5");
    txtPCs5.addKeyListener(this);
    
    gridx = 2;
    gridy = 12;
    panelCashDisp.add(txtPCsA5, localGridBagConstraints14);
    
    gridx = 0;
    gridy = 13;
    panelCashDisp.add(lblPS2, localGridBagConstraints14);
    
    gridx = 1;
    gridy = 13;
    panelCashDisp.add(txtPCs2, localGridBagConstraints14);
    txtPCs2.getDocument().addDocumentListener(new DataVoice.MyDocumentListener());
    txtPCs2.getDocument().putProperty("name", "txtPCs2");
    txtPCs2.addKeyListener(this);
    
    gridx = 2;
    gridy = 13;
    panelCashDisp.add(txtPCsA2, localGridBagConstraints14);
    
    gridx = 0;
    gridy = 14;
    panelCashDisp.add(lblPS1, localGridBagConstraints14);
    
    gridx = 1;
    gridy = 14;
    panelCashDisp.add(txtPCs1, localGridBagConstraints14);
    txtPCs1.getDocument().addDocumentListener(new DataVoice.MyDocumentListener());
    txtPCs1.getDocument().putProperty("name", "txtPCs1");
    txtPCs1.addKeyListener(this);
    
    gridx = 2;
    gridy = 14;
    panelCashDisp.add(txtPCsA1, localGridBagConstraints14);
    
    gridx = 0;
    gridy = 15;
    panelCashDisp.add(lblPS50, localGridBagConstraints14);
    
    gridx = 1;
    gridy = 15;
    panelCashDisp.add(txtPCs05, localGridBagConstraints14);
    txtPCs05.getDocument().addDocumentListener(new DataVoice.MyDocumentListener());
    txtPCs05.getDocument().putProperty("name", "txtPCs05");
    txtPCs05.addKeyListener(this);
    
    gridx = 2;
    gridy = 15;
    panelCashDisp.add(txtPCsA05, localGridBagConstraints14);
    
    gridx = 0;
    gridy = 16;
    panelCashDisp.add(lblToTalAmtCol, localGridBagConstraints14);
    
    gridx = 2;
    gridy = 16;
    panelCashDisp.add(txtTotalAmtCol, localGridBagConstraints14);
    
    gridx = 0;
    gridy = 17;
    panelCashDisp.add(lblAmtDifference, localGridBagConstraints14);
    
    gridx = 2;
    gridy = 17;
    panelCashDisp.add(txtAmtDifference, localGridBagConstraints14);
    
    txtPA1000.setText("0.0");
    txtPA1500.setText("0.0");
    txtPA100.setText("0.0");
    txtPA50.setText("0.0");
    txtPA20.setText("0.0");
    txtPA10.setText("0.0");
    txtPA5.setText("0.0");
    txtPA2.setText("0.0");
    txtPA1.setText("0.0");
    txtPCsA10.setText("0.0");
    txtPCsA5.setText("0.0");
    txtPCsA2.setText("0.0");
    txtPCsA1.setText("0.0");
    txtPCsA05.setText("0.0");
    txtTotalAmtCol.setText("0.0");
    txtAmtDifference.setText("0.0");
    
    txtPA1000.setEditable(false);
    txtPA1000.setFocusable(false);
    txtPA1500.setEditable(false);
    txtPA1500.setFocusable(false);
    txtPA100.setEditable(false);
    txtPA100.setFocusable(false);
    txtPA50.setEditable(false);
    txtPA50.setFocusable(false);
    txtPA20.setEditable(false);
    txtPA20.setFocusable(false);
    txtPA10.setEditable(false);
    txtPA10.setFocusable(false);
    txtPA5.setEditable(false);
    txtPA5.setFocusable(false);
    txtPA2.setEditable(false);
    txtPA2.setFocusable(false);
    txtPA1.setEditable(false);
    txtPA1.setFocusable(false);
    txtPCsA10.setEditable(false);
    txtPCsA10.setFocusable(false);
    txtPCsA5.setEditable(false);
    txtPCsA5.setFocusable(false);
    txtPCsA2.setEditable(false);
    txtPCsA2.setFocusable(false);
    txtPCsA5.setEditable(false);
    txtPCsA5.setFocusable(false);
    txtPCsA1.setEditable(false);
    txtPCsA1.setFocusable(false);
    txtPCsA05.setEditable(false);
    txtPCsA05.setFocusable(false);
    txtCashCollected.setEditable(false);
    txtCashCollected.setFocusable(false);
    txtTotalCouponCollection.setEditable(false);
    
    txtCashCollDate.setEditable(false);
    txtTotalAmtCol.setEditable(false);
    txtTotalAmtCol.setFocusable(false);
    txtCouponCollectDate.setEditable(false);
    txtTotalCollection.setEditable(false);
    txtAmtDifference.setEditable(false);
    txtAmtDifference.setFocusable(false);
    txtTotalTicketCollection.setEditable(false);
    txtTotalTopupCollection.setEditable(false);
    
    Font localFont1 = new Font(txtTotalCollection.getFont().getName(), 1, txtTotalCollection.getFont().getSize());
    txtTotalCollection.setFont(localFont1);
    




    GridBagConstraints localGridBagConstraints15 = new GridBagConstraints();
    insets = new Insets(2, 2, 2, 2);
    gridx = 0;
    gridy = 0;
    panelCashDate.add(lblCollectionDate, localGridBagConstraints15);
    
    gridx = 1;
    gridy = 0;
    panelCashDate.add(txtCashCollDate, localGridBagConstraints15);
    
    GridBagConstraints localGridBagConstraints16 = new GridBagConstraints();
    insets = new Insets(2, 2, 2, 2);
    gridx = 0;
    gridy = 0;
    panelGetCash.add(lblTotalCollectionAmt, localGridBagConstraints16);
    
    gridx = 1;
    gridy = 0;
    panelGetCash.add(txtCashCollected, localGridBagConstraints16);
    
    GridBagConstraints localGridBagConstraints17 = new GridBagConstraints();
    insets = new Insets(2, 2, 2, 2);
    
    gridx = 0;
    gridy = 0;
    panelCashCollection.add(panelCashDate, localGridBagConstraints13);
    
    gridx = 0;
    gridy = 1;
    panelCashCollection.add(panelGetCash, localGridBagConstraints13);
    

    gridx = 0;
    gridy = 2;
    panelCashCollection.add(panelCashDisp, localGridBagConstraints13);
    
    gridx = 0;
    gridy = 3;
    panelCashCollection.add(btnCauculateAmount, localGridBagConstraints13);
    



    GridBagConstraints localGridBagConstraints18 = new GridBagConstraints();
    insets = new Insets(10, 10, 10, 10);
    
    gridx = 0;
    gridy = 2;
    panelMain.add(panelWaybillTicket, localGridBagConstraints18);
    
    gridx = 0;
    gridy = 3;
    panelMain.add(panelButton, localGridBagConstraints18);
    
    gridx = 0;
    gridy = 4;
    panelMain.add(panelTicketCollection, localGridBagConstraints18);
    panelProgress.setVisible(false);
    


    GridBagConstraints localGridBagConstraints19 = new GridBagConstraints();
    insets = new Insets(5, 5, 5, 5);
    
    gridx = 0;
    gridy = 0;
    panelDisplayCont.add(panelHeaderAll, localGridBagConstraints19);
    
    gridx = 0;
    gridy = 1;
    panelDisplayCont.add(panelCreateWaybill, localGridBagConstraints19);
    
    gridx = 0;
    gridy = 2;
    panelDisplayCont.add(panelMain, localGridBagConstraints19);
    
    gridx = 0;
    gridy = 3;
    panelDisplayCont.add(panelCashCollection, localGridBagConstraints19);
    
    gridx = 0;
    gridy = 4;
    panelDisplayCont.add(panelCoupon2, localGridBagConstraints19);
    






    Container localContainer = getContentPane();
    localContainer.setLayout(new java.awt.FlowLayout());
    localContainer.add(panelFrontPage);
    localContainer.add(panelDisplayCont);
    


    HidePanel();
    

    txtData.setLineWrap(true);
    txtData.setEditable(false);
    
    txtSmartCardData.setLineWrap(true);
    txtSmartCardData.setEditable(false);
    
    txtWayData.setEditable(false);
    
    Font localFont2 = new Font("Arial", 1, 22);
    
    lblHeader.setFont(localFont2);
    
    btnUploadCouponData.setEnabled(true);
    btnCouponCollectCash.setEnabled(false);
    
    btnWayBill.addActionListener(this);
    btnCollectData.addActionListener(this);
    btnUploadData.addActionListener(this);
    btnDelWayBill.addActionListener(this);
    btnEraseData.addActionListener(this);
    btnWayBillNumber.addActionListener(this);
    btnUploadWayBill.addActionListener(this);
    btnCollectCash.addActionListener(this);
    btnGetTotalAmount.addActionListener(this);
    btnCauculateAmount.addActionListener(this);
    btnGetConductorCoupon.addActionListener(this);
    btnUploadCouponData.addActionListener(this);
    btnGetCardTopUp.addActionListener(this);
    btnUploadCardData.addActionListener(this);
    btnGetCouponAmount.addActionListener(this);
    btnCouponCollectCash.addActionListener(this);
    
    getConductorDetails();
  }
  


  public void keyPressed(KeyEvent paramKeyEvent)
  {
    if (paramKeyEvent.getKeyCode() == 10)
    {

      java.awt.KeyboardFocusManager.getCurrentKeyboardFocusManager().getFocusOwner().transferFocus();
      java.awt.KeyboardFocusManager.getCurrentKeyboardFocusManager().getFocusOwner().transferFocus();
    }
  }
  
  public void keyReleased(KeyEvent paramKeyEvent) {}
  
  public void keyTyped(KeyEvent paramKeyEvent) {}
  
  class MyDocumentListener implements javax.swing.event.DocumentListener {
    MyDocumentListener() {}
    
    public void insertUpdate(DocumentEvent paramDocumentEvent) {
      updateAmount(paramDocumentEvent, "Insert");
    }
    
    public void removeUpdate(DocumentEvent paramDocumentEvent)
    {
      updateAmount(paramDocumentEvent, "Remove");
    }
    


    public void changedUpdate(DocumentEvent paramDocumentEvent) {}
    


    public void updateAmount(DocumentEvent paramDocumentEvent, String paramString)
    {
      try
      {
        Document localDocument = paramDocumentEvent.getDocument();
        String str1 = localDocument.getText(0, localDocument.getLength());
        String str2 = " " + localDocument.getProperty("name");
        String str3 = "";
        
        str2 = str2.trim();
        float f;
        if (str2.equals("txtPC1000"))
        {
          f = Integer.parseInt(str1) * 1000;
          str3 = " " + f;
          txtPA1000.setText(str3);
        }
        else if (str2.equals("txtPC1500"))
        {
          f = Integer.parseInt(str1) * 500;
          str3 = " " + f;
          txtPA1500.setText(str3);
        }
        else if (str2.equals("txtPC100"))
        {
          f = Integer.parseInt(str1) * 100;
          str3 = " " + f;
          txtPA100.setText(str3);
        }
        else if (str2.equals("txtPC50"))
        {
          f = Integer.parseInt(str1) * 50;
          str3 = " " + f;
          txtPA50.setText(str3);
        }
        else if (str2.equals("txtPC20"))
        {
          f = Integer.parseInt(str1) * 20;
          str3 = " " + f;
          txtPA20.setText(str3);
        }
        else if (str2.equals("txtPC10"))
        {
          f = Integer.parseInt(str1) * 10;
          str3 = " " + f;
          txtPA10.setText(str3);
        }
        else if (str2.equals("txtPC5"))
        {
          f = Integer.parseInt(str1) * 5;
          str3 = " " + f;
          txtPA5.setText(str3);
        }
        else if (str2.equals("txtPC2"))
        {
          f = Integer.parseInt(str1) * 2;
          str3 = " " + f;
          txtPA2.setText(str3);
        }
        else if (str2.equals("txtPC1"))
        {
          f = Integer.parseInt(str1) * 1;
          str3 = " " + f;
          txtPA1.setText(str3);
        }
        else if (str2.equals("txtPCs10"))
        {
          f = Integer.parseInt(str1) * 10;
          str3 = " " + f;
          txtPCsA10.setText(str3);
        }
        else if (str2.equals("txtPCs5"))
        {
          f = Integer.parseInt(str1) * 5;
          str3 = " " + f;
          txtPCsA5.setText(str3);
        }
        else if (str2.equals("txtPCs2"))
        {
          f = Integer.parseInt(str1) * 2;
          str3 = " " + f;
          txtPCsA2.setText(str3);
        }
        else if (str2.equals("txtPCs1"))
        {
          f = Integer.parseInt(str1) * 1;
          str3 = " " + f;
          txtPCsA1.setText(str3);
        }
        else if (str2.equals("txtPCs05"))
        {
          f = Integer.parseInt(str1) * 50;
          str3 = " " + f / 100.0F;
          txtPCsA05.setText(str3);
        }
        
        getTotalAmoutCollected(str3);
      }
      catch (Exception localException) {}
    }
    










    public void getTotalAmoutCollected(String paramString)
    {
      try
      {
        Float localFloat1 = Float.valueOf(Float.parseFloat(txtPA1000.getText().trim()) + Float.parseFloat(txtPA1500.getText().trim()) + Float.parseFloat(txtPA100.getText().trim()) + Float.parseFloat(txtPA50.getText().trim()) + Float.parseFloat(txtPA20.getText().trim()) + Float.parseFloat(txtPA10.getText().trim()) + Float.parseFloat(txtPA5.getText().trim()) + Float.parseFloat(txtPA2.getText().trim()) + Float.parseFloat(txtPA1.getText().trim()) + Float.parseFloat(txtPCsA10.getText().trim()) + Float.parseFloat(txtPCsA5.getText().trim()) + Float.parseFloat(txtPCsA2.getText().trim()) + Float.parseFloat(txtPCsA1.getText().trim()) + Float.parseFloat(txtPCsA05.getText().trim()));
        












        String str = " " + localFloat1;
        txtTotalAmtCol.setText(str);
        
        Float localFloat2 = Float.valueOf(Float.parseFloat(txtCashCollected.getText().trim()) - localFloat1.floatValue());
        txtAmtDifference.setText("" + localFloat2);
      }
      catch (Exception localException) {}
    }
  }
  


  public void HidePanel()
  {
    panelHeaderAll.setVisible(false);
    panelCreateWaybill.setVisible(false);
    panelMain.setVisible(false);
    panelCashCollection.setVisible(false);
    panelCoupon2.setVisible(false);
  }
  
  private class MenuAction implements java.awt.event.ActionListener {
    private MenuAction() {}
    
    public void actionPerformed(ActionEvent paramActionEvent) {
      HidePanel();
      
      if (paramActionEvent.getSource() == menuItemCollection)
      {
        panelHeaderAll.setVisible(true);
        panelMain.setVisible(true);
      }
      else if (paramActionEvent.getSource() == menuItemCreateWaybill)
      {

        model = new DefaultTableModel();
        
        panelHeaderAll.setVisible(true);
        panelCreateWaybill.setVisible(true);
        model.addColumn("WayBill No");
        model.addColumn("Conductor");
        model.addColumn("Driver");
        model.addColumn("Vehicle");
        model.addColumn("ETM NO");
        model.addColumn("Division");
        model.addColumn("Division Code");
        model.addColumn("Depot Name");
        model.addColumn("Depot Code");
        model.addColumn("Schedule");
        model.addColumn("Waybill Date");
        
        tblWayBillDetails.setModel(model);
        
        tblWayBillDetails.getColumnModel().getColumn(0).setPreferredWidth(90);
        tblWayBillDetails.getColumnModel().getColumn(1).setPreferredWidth(100);
        tblWayBillDetails.getColumnModel().getColumn(2).setPreferredWidth(100);
        tblWayBillDetails.getColumnModel().getColumn(3).setPreferredWidth(100);
        tblWayBillDetails.getColumnModel().getColumn(4).setPreferredWidth(75);
      }
      else if (paramActionEvent.getSource() == menuItemCouponTicket)
      {
        panelHeaderAll.setVisible(true);
        panelCoupon2.setVisible(true);
        
        Date localDate = new Date();
        
        Timestamp localTimestamp = new Timestamp(localDate.getTime());
        String str = "" + localTimestamp;
        str = str.substring(0, 10);
        txtCouponCollectDate.setText(str);
        




        couponModel.setNumRows(0);
        couponModel.setColumnCount(0);
        
        couponModel.addColumn("Denomination");
        couponModel.addColumn("Ticket Block Series Number");
        couponModel.addColumn("Ticket Start Number");
        couponModel.addColumn("Ticket End Number");
        couponModel.addColumn("No. of Tickets");
        couponModel.addColumn("Amount");
        couponModel.addColumn("Nutrition Tax");
        couponModel.addColumn("TicketMax Number");
        

        tblConductorCoupon.getColumnModel().getColumn(0).setPreferredWidth(100);
        tblConductorCoupon.getColumnModel().getColumn(1).setPreferredWidth(150);
        tblConductorCoupon.getColumnModel().getColumn(2).setPreferredWidth(150);
        tblConductorCoupon.getColumnModel().getColumn(3).setPreferredWidth(150);
        tblConductorCoupon.getColumnModel().getColumn(4).setPreferredWidth(100);
        tblConductorCoupon.getColumnModel().getColumn(5).setPreferredWidth(100);
        tblConductorCoupon.getColumnModel().getColumn(6).setPreferredWidth(0);
        tblConductorCoupon.getColumnModel().getColumn(7).setPreferredWidth(0);
        
        tblConductorCoupon.putClientProperty("terminateEditOnFocusLost", Boolean.valueOf(true));
        


        JTextField localJTextField = new JTextField();
        localJTextField.setEditable(false);
        javax.swing.DefaultCellEditor localDefaultCellEditor1 = new javax.swing.DefaultCellEditor(localJTextField);
        
        javax.swing.DefaultCellEditor localDefaultCellEditor2 = new javax.swing.DefaultCellEditor(new JTextField());
        localDefaultCellEditor2.setClickCountToStart(1);
        
        for (int i = 0; i < tblConductorCoupon.getColumnModel().getColumnCount(); i++) {
          TableColumn localTableColumn;
          if (i == 3)
          {
            localTableColumn = tblConductorCoupon.getColumnModel().getColumn(i);
            localTableColumn.setCellEditor(localDefaultCellEditor2);

          }
          else
          {
            localTableColumn = tblConductorCoupon.getColumnModel().getColumn(i);
            localTableColumn.setCellEditor(localDefaultCellEditor1);
          }
        }
      }
    }
  }
  





  public void tableChanged(javax.swing.event.TableModelEvent paramTableModelEvent)
  {
    try
    {
      String str1 = "";
      int i = paramTableModelEvent.getFirstRow();
      int j = paramTableModelEvent.getColumn();
      if (j == 3)
      {

        TableModel localTableModel = (TableModel)paramTableModelEvent.getSource();
        String str2 = localTableModel.getColumnName(j);
        Object localObject = localTableModel.getValueAt(i, j);
        



        String str3 = " " + localObject;
        



        try
        {
          String str4 = " " + localTableModel.getValueAt(i, 0);
          String str5 = " " + localTableModel.getValueAt(i, 2);
          String str6 = " " + localTableModel.getValueAt(i, 6);
          String str7 = " " + localTableModel.getValueAt(i, 7);
          
          int k = Integer.parseInt(str5.trim());
          int m = Integer.parseInt(str3.trim());
          int n = Integer.parseInt(str7.trim());
          Float localFloat1;
          Float localFloat2; Float localFloat3; Float localFloat4; Float localFloat5; Integer localInteger; Float localFloat6; if (m > 0)
          {
            if (m < k)
            {
              JOptionPane.showMessageDialog(this, "Ticket End Number should be greater than start no.", "Ticket Number", 0);
              return;
            }
            if (m > n)
            {
              JOptionPane.showMessageDialog(this, "Ticket End Number should be less than max no.", "Ticket Number", 0);
              return;
            }
            

            localFloat1 = Float.valueOf(Float.parseFloat(str4.trim()));
            localFloat2 = Float.valueOf(Float.parseFloat(str5.trim()));
            localFloat3 = Float.valueOf(Float.parseFloat(str3.trim()));
            localFloat4 = Float.valueOf(Float.parseFloat(str6.trim()));
            
            localFloat5 = Float.valueOf(localFloat3.floatValue() - localFloat2.floatValue());
            

            localInteger = Integer.valueOf(localFloat5.intValue());
            localFloat6 = Float.valueOf((localFloat1.floatValue() + localFloat4.floatValue()) * localFloat5.floatValue());
            str1 = localFloat6.toString();
            


            localTableModel.setValueAt(localInteger, i, 4);
            localTableModel.setValueAt(localFloat6, i, 5);
            calculateCouponCollectAmount();
            calculateTotalFare();

          }
          else if (m == 0)
          {

            localFloat1 = Float.valueOf(Float.parseFloat(str4.trim()));
            localFloat2 = Float.valueOf(Float.parseFloat(str5.trim()));
            localFloat3 = Float.valueOf(Float.parseFloat(str7.trim()));
            localFloat4 = Float.valueOf(Float.parseFloat(str6.trim()));
            
            localFloat5 = Float.valueOf(localFloat3.floatValue() - localFloat2.floatValue() + 1.0F);
            
            localInteger = Integer.valueOf(localFloat5.intValue());
            localFloat6 = Float.valueOf((localFloat1.floatValue() + localFloat4.floatValue()) * localFloat5.floatValue());
            str1 = localFloat6.toString();
            
            localTableModel.setValueAt(localInteger, i, 4);
            localTableModel.setValueAt(localFloat6, i, 5);
            calculateCouponCollectAmount();
            calculateTotalFare();
          }
          else
          {
            JOptionPane.showMessageDialog(this, "Ticket Number should be integer", "Ticket Number", 0);
            return;
          }
        }
        catch (NumberFormatException localNumberFormatException)
        {
          JOptionPane.showMessageDialog(this, "Ticket Number should be integer", "Ticket Number", 0);
          return;
        }
      }
    }
    catch (Exception localException) {}
  }
  






  public void calculateCouponCollectAmount()
  {
    try
    {
      int i = tblConductorCoupon.getRowCount();
      Float localFloat = Float.valueOf(0.0F);
      for (int j = 0; j < i; j++)
      {
        Object localObject = tblConductorCoupon.getModel().getValueAt(j, 5);
        String str = localObject.toString();
        float f = Float.parseFloat(str);
        
        localFloat = Float.valueOf(localFloat.floatValue() + f);
        txtTotalCouponCollection.setText("" + localFloat);
      }
    }
    catch (Exception localException) {}
  }
  


  public void SetData(Object paramObject, int paramInt1, int paramInt2)
  {
    tblConductorCoupon.getModel().setValueAt(paramObject, paramInt1, paramInt2);
  }
  
  public void initListener()
  {
    try
    {
      serialPort.addEventListener(this);
      serialPort.notifyOnDataAvailable(true);
    }
    catch (java.util.TooManyListenersException localTooManyListenersException) {}
  }
  


  public void disConnect()
  {
    try
    {
      serialPort.removeEventListener();
      serialPort.close();
      input.close();
      output.close();
    }
    catch (Exception localException) {}
  }
  


  public void serialEvent(javax.comm.SerialPortEvent paramSerialPortEvent)
  {
    if (paramSerialPortEvent.getEventType() == 1)
    {
      try
      {
        int i = -1;
        byte[] arrayOfByte = new byte['E'];
        String str = "";
        

        while (input.available() > 0)
        {

          i = input.read(arrayOfByte);
          str = new String(arrayOfByte, 0, i);
          
          concatDeviceData += str;
          
          StringBuffer localStringBuffer;
          int m;
          if ((dataType.equals("Ticket")) || (dataType.equals("WayBill")))
          {

            if (str.equals("$"))
            {
              int j = (char)commandString;
              output.write(j);
            }
            


            char[] arrayOfChar1 = str.toCharArray();
            localStringBuffer = new StringBuffer();
            for (m = 0; m < arrayOfChar1.length; m++)
            {
              if (Integer.toHexString(arrayOfChar1[m]).equals("4"))
              {
                disConnect();
                if (dataType.equals("Ticket"))
                {
                  btnCollectData.setEnabled(true);
                  btnUploadData.setEnabled(true);
                  
                  calculateFare();
                }
                else if (dataType.equals("WayBill"))
                {

                  btnWayBill.setEnabled(true);
                  btnCollectData.setEnabled(true);
                  getEtimDetails();
                }
              }
            }
          }
          else {
            int k;
            if (dataType.equals("DelWayBill"))
            {
              if (str.equals("$"))
              {
                k = (char)commandString;
                output.write(k);
                
                disConnect();
              }
            }
            else if (dataType.equals("Erase"))
            {
              if (str.equals("$"))
              {
                k = (char)commandString;
                output.write(k);
              }
              else if (str.equals("0"))
              {
                k = (char)tcketEraseData1;
                output.write(k);
              }
              else
              {
                disConnect();
              }
            }
            else if (dataType.equals("UploadWayBill"))
            {
              if (str.equals("$"))
              {
                k = (char)commandString;
                output.write(k);
              }
              else if ((str.equals("O")) && (chkWayBillSend == 0))
              {
                chkWayBillSend = 1;
                output.write(conCatenateWayBill.getBytes(java.nio.charset.Charset.forName("UTF-8")));









              }
              else
              {








                disConnect();
              }
            }
            else if (dataType.equals("Cardtopup"))
            {
              if (str.equals("$"))
              {
                k = (char)commandString;
                output.write(k);
              }
              
              txtSmartCardData.append(str);
              
              char[] arrayOfChar2 = str.toCharArray();
              localStringBuffer = new StringBuffer();
              for (m = 0; m < arrayOfChar2.length; m++)
              {
                if (Integer.toHexString(arrayOfChar2[m]).equals("4"))
                {
                  disConnect();
                  calculateTopupAmount();
                }
              }
            }
          }
          


          if (dataType.equals("Ticket"))
          {
            txtData.append(str);
          }
          else if (dataType.equals("WayBill"))
          {
            txtWayData.append(str);
          }
        }
      }
      catch (Exception localException) {}
    }
  }
  









  public boolean initIOStream()
  {
    boolean bool = false;
    
    try
    {
      input = serialPort.getInputStream();
      output = serialPort.getOutputStream();
      return true;
    }
    catch (java.io.IOException localIOException) {}
    

    return bool;
  }
  


  public void connect()
  {
    try
    {
      String str = (String)cmbPortList.getSelectedItem();
      CommPortIdentifier localCommPortIdentifier = CommPortIdentifier.getPortIdentifier(str);
      if (!localCommPortIdentifier.isCurrentlyOwned())
      {
        commPort = localCommPortIdentifier.open(getClass().getName(), 2000);
        if ((commPort instanceof SerialPort))
        {
          serialPort = (SerialPort)commPort;
          serialPort.setSerialPortParams(115200, 8, 1, 0);
          serialPort.enableReceiveTimeout(0);
        }
      }
    }
    catch (Exception localException) {}
  }
  






  public void getEtimDetails()
  {
    String str1 = "";
    etmNumberValue = "";
    String str2 = txtWayData.getText();
    str2 = str2.replaceAll("[$]", "");
    str2 = str2.trim();
    if (str2.contains("BALAJI"))
    {
      machineType = "BALAJI";
      etmNumberValue = str2.substring(63, 66);

    }
    else
    {
      machineType = "SAI";
      etmNumberValue = str2.substring(63, 66);
    }
  }
  











  public void calculateFare()
  {
    txtTotalCollection.setText("");
    txtCashCollected.setText("");
    txtAmtDifference.setText("");
    txtTotalTopupCollection.setText("");
    
    String str1 = txtData.getText();
    str1 = str1.replaceAll("[$]", "");
    str1 = str1.trim();
    if (!str1.equals(""))
    {
      String[] arrayOfString = txtData.getText().split("\\n");
      int i = arrayOfString.length;
      
      String str2 = "";
      String str3 = "";
      float f1 = 0.0F;
      float f2 = 0.0F;
      float f3 = 0.0F;
      for (int j = 0; j < i; j++)
      {
        try
        {
          str2 = arrayOfString[j];
          str2 = str2.replaceAll("[$]", "");
          str2 = str2.replaceAll("\n", "");
          str2 = str2.replaceAll("\r", "");
          
          if ((!str2.equals("")) && (str2.length() > 1))
          {
            if (machineType.equals("BALAJI"))
            {
              str3 = str2.substring(15, 19).trim();
            }
            else
            {
              str3 = str2.substring(7, 11).trim();
            }
            
            if (!str3.equals("CARD"))
            {
              if (machineType.equals("BALAJI"))
              {
                f1 += Integer.parseInt(str2.substring(44, 51));
              }
              else
              {
                f1 += Integer.parseInt(str2.substring(36, 43));
              }
            }
          }
        }
        catch (Exception localException) {}
      }
      



      f2 = f1 / 100.0F;
      txtTotalTicketCollection.setText("" + f2);
      
      calculateTotalFare();
    }
  }
  



  public void calculateTopupAmount()
  {
    String str1 = txtSmartCardData.getText();
    str1 = str1.replaceAll("[$]", "");
    str1 = str1.trim();
    
    if (!str1.equals(""))
    {
      String[] arrayOfString = str1.split("@");
      int i = arrayOfString.length;
      String str2 = "";
      
      float f1 = 0.0F;
      float f2 = 0.0F;
      for (int j = 0; j < i; j++)
      {
        str2 = arrayOfString[j];
        str2 = str2.replaceAll("[$]", "");
        str2 = str2.replaceAll("\n", "");
        str2 = str2.replaceAll("\r", "");
        
        if ((!str2.equals("")) && (str2.length() > 1))
        {
          f1 += Integer.parseInt(str2.substring(16, 32).trim());
        }
      }
      
      f2 = f1 / 100.0F;
      txtTotalTopupCollection.setText("" + f2);
      calculateTotalFare();
      btnUploadCardData.setEnabled(true);
    }
  }
  
  public void calculateTotalFare()
  {
    float f1 = 0.0F;
    float f2 = 0.0F;
    float f3 = 0.0F;
    float f4 = 0.0F;
    

    String str1 = txtTotalTicketCollection.getText().trim();
    String str2 = txtTotalTopupCollection.getText().trim();
    String str3 = txtTotalCouponCollection.getText().trim();
    
    if (!str1.equals(""))
    {
      f2 = Float.parseFloat(str1);
    }
    
    if (!str2.equals(""))
    {
      f3 = Float.parseFloat(str2);
    }
    
    if (!str3.equals(""))
    {
      f4 = Float.parseFloat(str3);
    }
    
    f1 = f2 + f3 + f4;
    




    txtTotalCollection.setText("" + f1);
    txtCashCollected.setText("" + f1);
    txtAmtDifference.setText("" + f1);
  }
  

  public void actionPerformed(ActionEvent paramActionEvent)
  {
    if (paramActionEvent.getSource() == btnCollectData)//ticketData
    {

      String str1 = txtWayData.getText();
      str1 = str1.replaceAll("$", "");
      if (str1.length() >= 82)
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
          if (initIOStream() == true)
          {
            initListener();
            int k = (char)dollarData;
            output.write(k);
          }
          setCursor(defaultCursor);

        }
        catch (Exception localException6) {}

      }
      else
      {
        JOptionPane.showMessageDialog(this, "Please collect the waybill first...", "Error", 0);

      }
      

    }
    else if (paramActionEvent.getSource() == btnWayBill)//collect waybill
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
        if (initIOStream() == true)
        {
          initListener();
          int i = (char)dollarData;
          output.write(i); } } catch (Exception localException1) {} } else { String str2;
      String str5;
      String str7;
      String str9;
      Object localObject6;
      Object localObject7;
      Object localObject8;
      Object localObject9;
      String str11; Object localObject11; Object localObject12; Object localObject13; Object localObject15; String str13; Object localObject18; 
	  if (paramActionEvent.getSource() == btnUploadCardData)//upload card data
      {
        btnUploadCardData.setEnabled(false);
        btnCollectCash.setEnabled(true);
        
        insertSmsContent(etmNumberValue, "Upload Topup Data");
        

        str2 = txtSmartCardData.getText();
        str2 = str2.replaceAll("[$]", "");
        str2 = str2.replaceAll("o", "");
        str2 = str2.replaceAll("O", "");
        str2 = str2.trim();
        
        if (!str2.equals(""))
        {
          str5 = "";
          str7 = "";
          str9 = "";
          localObject6 = "";
          localObject7 = "";
          localObject8 = "";
          localObject9 = "";
          str11 = "";
          localObject11 = "";
          localObject12 = "";
          localObject13 = "";
          
          try
          {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            db = DriverManager.getConnection("jdbc:mysql://" + server + ":3306/" + database, username, password);
            dbmd = db.getMetaData();
            sql = db.createStatement();
          }
          catch (Exception localException13)
          {
            btnUploadCardData.setEnabled(true);
            JOptionPane.showMessageDialog(this, "Error...Please try later", "Smart Card Upload", 0);
            return;
          }
          
          try
          {
            setCursor(busyCursor);
            Date localDate1 = new Date();
            localObject15 = new Timestamp(localDate1.getTime());
            
            str13 = txtWayData.getText();
            str13 = str13.replaceAll("[$]", "");
            str5 = str13.substring(0, 7);
            str7 = str13.substring(7, 17);
            str9 = str13.substring(17, 27);
            localObject6 = str13.substring(27, 37);
            localObject7 = str13.substring(37, 46);
            localObject8 = str13.substring(46, 48);
            localObject9 = str13.substring(48, 57);
            str11 = str13.substring(57, 59);
            localObject11 = str13.substring(59, 63);
            localObject12 = str13.substring(63, 66);
            localObject13 = str13.substring(66, 82);
            
            localObject18 = db.prepareStatement("INSERT INTO tbl_waybill_handheld_smartcard_data (fldv_waybill_no,fldv_conductor_name, \tfldv_driver_name,fldv_vehicle_number,fldv_division_name,fldv_division_code,fldv_depot_name,fldv_depot_code,fldv_schedule,fldv_etm_number,fldv_waybill_date_time,fldl_smartcard_data,fldc_status,fldi_user_id,flddt_last_upd_date) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,NOW())");
            ((PreparedStatement)localObject18).setString(1, str5);
            ((PreparedStatement)localObject18).setString(2, str7);
            ((PreparedStatement)localObject18).setString(3, str9);
            ((PreparedStatement)localObject18).setString(4, (String)localObject6);
            ((PreparedStatement)localObject18).setString(5, (String)localObject7);
            ((PreparedStatement)localObject18).setString(6, (String)localObject8);
            ((PreparedStatement)localObject18).setString(7, (String)localObject9);
            ((PreparedStatement)localObject18).setString(8, str11);
            ((PreparedStatement)localObject18).setString(9, (String)localObject11);
            ((PreparedStatement)localObject18).setString(10, (String)localObject12);
            ((PreparedStatement)localObject18).setString(11, (String)localObject13);
            ((PreparedStatement)localObject18).setString(12, str2);
            ((PreparedStatement)localObject18).setString(13, "N");
            ((PreparedStatement)localObject18).setInt(14, sessId);
            ((PreparedStatement)localObject18).executeUpdate();
            ((PreparedStatement)localObject18).close();
            
            JOptionPane.showMessageDialog(this, "Smart Card Details uploaded successfully...", "Smart Card Upload", 0);
            db.close();
            
            btnUploadCardData.setEnabled(true);
            btnCollectCash.setEnabled(true);
            setCursor(defaultCursor);

          }
          catch (Exception localException14)
          {
            btnUploadCardData.setEnabled(true);
            JOptionPane.showMessageDialog(this, "Error...Please try later", "Smart Card Upload", 0);
            return;
          }
        } } else { Object localObject21;
        int i17;
        int i16;
        if (paramActionEvent.getSource() == btnUploadData)//upload ticketData
        {
          str2 = txtData.getText();
          str2 = str2.replaceAll("[$]", "");
          str2 = str2.trim();
          if (!str2.equals(""))
          {


            btnUploadData.setEnabled(false);
            

            insertSmsContent(etmNumberValue, "Upload Ticket");
            



            str5 = "";
            str7 = "";
            str9 = "";
            localObject6 = "";
            localObject7 = "";
            localObject8 = "";
            localObject9 = "";
            str11 = "";
            localObject11 = "";
            localObject12 = "";
            localObject13 = "";
            


            try
            {
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              db = DriverManager.getConnection("jdbc:mysql://" + server + ":3306/" + database, username, password);
              
              dbmd = db.getMetaData();
              sql = db.createStatement();
            }
            catch (Exception localException15)
            {
              localObject15 = new java.io.StringWriter();
              localException15.printStackTrace(new java.io.PrintWriter((java.io.Writer)localObject15));
              
              btnUploadData.setEnabled(true);
              panelProgress.setVisible(false);
              JOptionPane.showMessageDialog(this, "Error...Please try later", "Ticket Upload", 0);
              return;
            }
            try
            {
              setCursor(busyCursor);
              Date localDate2 = new Date();
              localObject15 = new Timestamp(localDate2.getTime());
              
              str13 = txtWayData.getText();
              str13 = str13.replaceAll("[$]", "");
              

              if (machineType.equals("BALAJI"))
              {
                str5 = str13.substring(0, 7);
                str7 = str13.substring(7, 17);
                str9 = str13.substring(17, 27);
                localObject6 = str13.substring(27, 37);
                localObject7 = str13.substring(37, 46);
                localObject8 = str13.substring(46, 48);
                localObject9 = str13.substring(48, 57);
                str11 = str13.substring(57, 59);
                localObject11 = str13.substring(59, 63);
                localObject12 = str13.substring(63, 66);
                localObject13 = str13.substring(93, 109);

              }
              else
              {

                str5 = str13.substring(0, 7);
                str7 = str13.substring(7, 17);
                str9 = str13.substring(17, 27);
                localObject6 = str13.substring(27, 37);
                localObject7 = str13.substring(37, 46);
                localObject8 = str13.substring(46, 48);
                localObject9 = str13.substring(48, 57);
                str11 = str13.substring(57, 59);
                localObject11 = str13.substring(59, 63);
                localObject12 = str13.substring(63, 66);
                localObject13 = str13.substring(66, 82);
              }
              
              Object[] localObject19 = txtData.getText().split("\\n");
              
              int i14 = Array.getLength(localObject19);//localObject18.length;
              
              localObject21 = "";
              
              i17 = 0;
              String str15 = "";
              for (int i15 = 0; i15 < i14; i15++)
              {
                try
                {

                  i16 = 0;
                  localObject21 = localObject19[i15];
                  localObject21 = ((String)localObject21).replaceAll("[$]", "");
                  localObject21 = ((String)localObject21).replaceAll("\n", "");
                  localObject21 = ((String)localObject21).replaceAll("\r", "");
                  
                  if ((!((String)localObject21).equals("")) && (((String)localObject21).length() > 1))
                  {



                    try
                    {




                      try
                      {



                        i17 += 1;
                        if (str15.equals(""))
                        {
                          str15 = "('" + str5 + "','" + str7 + "','" + str9 + "','" + (String)localObject6 + "','" + (String)localObject7 + "','" + (String)localObject8 + "','" + (String)localObject9 + "','" + str11 + "','" + (String)localObject11 + "','" + (String)localObject12 + "','" + (String)localObject13 + "','" + (String)localObject21 + "','" + machineType + "','N','" + sessId + "',NOW())";
                        }
                        else
                        {
                          str15 = str15 + " ," + "('" + str5 + "','" + str7 + "','" + str9 + "','" + (String)localObject6 + "','" + (String)localObject7 + "','" + (String)localObject8 + "','" + (String)localObject9 + "','" + str11 + "','" + (String)localObject11 + "','" + (String)localObject12 + "','" + (String)localObject13 + "','" + (String)localObject21 + "','" + machineType + "','N','" + sessId + "',NOW())";
                        }
                        
                        if (i17 == 100)
                        {
                          PreparedStatement localPreparedStatement5 = db.prepareStatement("INSERT INTO tbl_waybill_ticket_handheld_data_dummy (fldv_waybill_no,fldv_conductor_name,fldv_driver_name,fldv_vehicle_number,fldv_division_name,fldv_division_code,fldv_depot_name,fldv_depot_code,fldv_schedule,fldv_etm_number,fldv_waybill_date_time,fldv_ticket_data,fldv_vendor_name,fldc_status,fldi_user_id,flddt_last_upd_date) VALUES " + str15 + "");
                          localPreparedStatement5.executeUpdate();
                          localPreparedStatement5.close();
                          i17 = 0;
                          str15 = "";








                        }
                        








                      }
                      catch (Exception localException18)
                      {








                        btnUploadData.setEnabled(true);
                        panelProgress.setVisible(false);
                        
                        JOptionPane.showMessageDialog(this, "Error...Please try later", "Ticket Upload", 0);
                        setCursor(defaultCursor);
                        


                        return;
                      }
                      

                    }
                    catch (Exception localException19)
                    {
                      btnUploadData.setEnabled(true);
                      panelProgress.setVisible(false);
                      JOptionPane.showMessageDialog(this, "Error...Please try later", "Ticket Upload", 0);
                      setCursor(defaultCursor);
                      


                      return;
                    }
                    
                  }
                  

                }
                catch (Exception localException20)
                {

                  btnUploadData.setEnabled(true);
                  panelProgress.setVisible(false);
                  JOptionPane.showMessageDialog(this, "Error...Please try later", "Ticket Upload", 0);
                  setCursor(defaultCursor);
                  


                  return;
                }
              }
              


              if (i17 < 100)
              {
                try
                {

                  PreparedStatement localPreparedStatement6 = db.prepareStatement("INSERT INTO tbl_waybill_ticket_handheld_data_dummy (fldv_waybill_no,fldv_conductor_name,fldv_driver_name,fldv_vehicle_number,fldv_division_name,fldv_division_code,fldv_depot_name,fldv_depot_code,fldv_schedule,fldv_etm_number,fldv_waybill_date_time,fldv_ticket_data,fldv_vendor_name,fldc_status,fldi_user_id,flddt_last_upd_date) VALUES " + str15 + "");
                  localPreparedStatement6.executeUpdate();
                  localPreparedStatement6.close();
                  i17 = 0;
                  str15 = "";
                }
                catch (Exception localException21)
                {
                  btnUploadData.setEnabled(true);
                  panelProgress.setVisible(false);
                  JOptionPane.showMessageDialog(this, "Error...Please try later", "Ticket Upload", 0);
                  setCursor(defaultCursor);
                  


                  return;
                }
              }
              
              JOptionPane.showMessageDialog(this, "Tickets uploaded successfully...", "Ticket Upload", 0);
              db.close();
              panelProgress.setVisible(false);
              btnUploadData.setEnabled(true);
              

              if (machineType.equals("BALAJI"))
              {
                btnCollectCash.setEnabled(true);
              }
              else
              {
                btnGetCardTopUp.setEnabled(true);
              }
              
              setCursor(defaultCursor);


            }
            catch (Exception localException16)
            {

              panelProgress.setVisible(false);
              btnUploadData.setEnabled(true);
              setCursor(defaultCursor);
            }
          }
        } else { int m;
          if (paramActionEvent.getSource() == btnEraseData)//erase ticket
          {
            str2 = txtWayData.getText();
            str2 = str2.replaceAll("$", "");
            if (str2.length() >= 82)
            {

              insertSmsContent(etmNumberValue, "Erase Ticket");
              


              m = JOptionPane.showConfirmDialog(this, "Do you want to erase the tickets from the Hand held device?", "Erase Tickets", 0, 2);
              if (m == 0)
              {
                dataType = "Erase";
                commandString = ticketEraseData;
                
                try
                {
                  connect();
                  if (initIOStream() == true)
                  {
                    initListener();
                    int i3 = (char)dollarData;
                    output.write(i3);
                  }
                  

                }
                catch (Exception localException11) {}
              }
              

            }
            else
            {
              JOptionPane.showMessageDialog(this, "Please collect the waybill first...", "Error", 0);

            }
            

          }
          else if (paramActionEvent.getSource() == btnGetCardTopUp)//collect card data
          {

            insertSmsContent(etmNumberValue, "Download Topup Data");
            
            btnUploadCardData.setEnabled(true);
            dataType = "Cardtopup";
            txtSmartCardData.setText("");
            commandString = cardTopUp;
            try
            {
              connect();
              if (initIOStream() == true)
              {
                initListener();
                int j = (char)dollarData;
                output.write(j);
              }
            }
            catch (Exception localException2) {}
          }
          else
          {
            String str3;
            if (paramActionEvent.getSource() == btnDelWayBill)//delete waybill
            {
              str3 = txtWayData.getText();
              str3 = str3.replaceAll("$", "");
              if (str3.length() >= 82)
              {

                insertSmsContent(etmNumberValue, "Delete Waybill");
                


                m = JOptionPane.showConfirmDialog(this, "Do you want to erase the waybill from the Hand held device?", "Erase Waybill", 0, 2);
                if (m == 0)
                {
                  dataType = "DelWayBill";
                  commandString = wayBillEraseData;
                  
                  try
                  {
                    connect();
                    if (initIOStream() == true)
                    {
                      initListener();
                      int i4 = (char)dollarData;
                      output.write(i4);
                    }
                    

                  }
                  catch (Exception localException12) {}
                }
              }
              else
              {
                JOptionPane.showMessageDialog(this, "Please collect the waybill first...", "Error", 0);
              }
            }
            else
            {
              Object localObject3;
              if (paramActionEvent.getSource() == btnWayBillNumber)
              {
                try
                {
                  model.setRowCount(0);
                  setCursor(busyCursor);
                  Class.forName("com.mysql.jdbc.Driver").newInstance();
                  db = DriverManager.getConnection("jdbc:mysql://" + server + ":3306/" + database, username, password);
                  
                  dbmd = db.getMetaData();
                  sql = db.createStatement();
                  
                  str3 = txtWayBillNo.getText();
                  str3 = str3.trim();
                  
                  PreparedStatement localPreparedStatement1;
                  if (!str3.equals(""))
                  {
                    localPreparedStatement1 = db.prepareStatement("select fldv_waybill_no,fldv_conductor_employee_code ,fldv_driver_employee_code ,fldv_vehicle_number,fldv_division_name,fldv_division_code,fldv_depot_name,fldv_depot_code,fldv_schedule,fldv_etm_number,fldv_waybill_created_date from tbl_waybill_mst where fldv_waybill_no = '" + str3 + "' and fldc_status = 'Y' and fldc_waybill_open_close_status = 'N'");

                  }
                  else
                  {
                    localPreparedStatement1 = db.prepareStatement("select fldv_waybill_no,fldv_conductor_employee_code ,fldv_driver_employee_code ,fldv_vehicle_number,fldv_division_name,fldv_division_code,fldv_depot_name,fldv_depot_code,fldv_schedule,fldv_etm_number,fldv_waybill_created_date from tbl_waybill_mst where  fldc_status = 'Y' and fldc_waybill_open_close_status = 'N' order by fldv_waybill_no asc");
                  }
                  
                  localObject3 = localPreparedStatement1.executeQuery();
                  while (((ResultSet)localObject3).next())
                  {
                    model.addRow(new Object[] { ((ResultSet)localObject3).getString(1), ((ResultSet)localObject3).getString(2), ((ResultSet)localObject3).getString(3), ((ResultSet)localObject3).getString(4), ((ResultSet)localObject3).getString(10), ((ResultSet)localObject3).getString(5), ((ResultSet)localObject3).getString(6), ((ResultSet)localObject3).getString(7), ((ResultSet)localObject3).getString(8), ((ResultSet)localObject3).getString(9), ((ResultSet)localObject3).getString(11) });
                  }
                  ((ResultSet)localObject3).close();
                  db.close();
                  setCursor(defaultCursor);
                }
                catch (Exception localException3) {}
              }
              else
              {
                Object localObject14;
                







                if (paramActionEvent.getSource() == btnUploadWayBill)//upload waybill
                {
                  try
                  {
                    String str4 = txtWayData.getText();
                    str4 = str4.replaceAll("$", "");
                    if (str4.length() < 82)
                    {
                      JOptionPane.showMessageDialog(this, "Please collect the waybill first...", "Error", 0);


                    }
                    else
                    {

                      chkWayBillSend = 0;
                      int n = tblWayBillDetails.getSelectedRow();
                      String.format("%1$-7s", new Object[] { "san" });
                      localObject3 = String.format("%1$-7s", new Object[] { (String)tblWayBillDetails.getModel().getValueAt(n, 0) });
                      str9 = String.format("%1$-10s", new Object[] { (String)tblWayBillDetails.getModel().getValueAt(n, 1) });
                      localObject6 = String.format("%1$-10s", new Object[] { (String)tblWayBillDetails.getModel().getValueAt(n, 2) });
                      localObject7 = String.format("%1$-10s", new Object[] { (String)tblWayBillDetails.getModel().getValueAt(n, 3) });
                      localObject8 = String.format("%1$-3s", new Object[] { (String)tblWayBillDetails.getModel().getValueAt(n, 4) });
                      localObject9 = String.format("%1$-9s", new Object[] { (String)tblWayBillDetails.getModel().getValueAt(n, 5) });
                      str11 = String.format("%1$-2s", new Object[] { (String)tblWayBillDetails.getModel().getValueAt(n, 6) });
                      localObject11 = String.format("%1$-9s", new Object[] { (String)tblWayBillDetails.getModel().getValueAt(n, 7) });
                      localObject12 = String.format("%1$-2s", new Object[] { (String)tblWayBillDetails.getModel().getValueAt(n, 8) });
                      localObject13 = String.format("%1$-4s", new Object[] { (String)tblWayBillDetails.getModel().getValueAt(n, 9) });
                      localObject14 = String.format("%1$-16s", new Object[] { (String)tblWayBillDetails.getModel().getValueAt(n, 10) });
                      
                      char c = (char)endOfString;
                      if (machineType.equals("BALAJI"))
                      {
                        conCatenateWayBill = (String)localObject3 + str9 + (String)localObject6 + (String)localObject7 + (String)localObject9 + str11 + (String)localObject11 + (String)localObject12 + (String)localObject13 + (String)localObject8 + (String)localObject14 + taxFactor + c;
                      }
                      else
                      {
                        conCatenateWayBill = (String)localObject3 + str9 + (String)localObject6 + (String)localObject7 + (String)localObject9 + str11 + (String)localObject11 + (String)localObject12 + (String)localObject13 + (String)localObject8 + (String)localObject14 + c;
                      }
                      dataType = "UploadWayBill";
                      commandString = wayBillUpload;
                      

                      try
                      {
                        connect();
                        if (initIOStream() == true)
                        {
                          initListener();
                          int i13 = (char)dollarData;
                          output.write(i13);
                        }
                      }
                      catch (Exception localException17) {}
                    }
                  }
                  catch (Exception localException4) {}
                }
                else
                {
                  Object localObject1;
                  

                  Object localObject2;
                  

                  if (paramActionEvent.getSource() == btnCollectCash)//collect cash
                  {
                    HidePanel();
                    panelHeaderAll.setVisible(true);
                    panelCashCollection.setVisible(true);
                    

                    insertSmsContent(etmNumberValue, "Cash Collection");
                    

                    localObject1 = new Date();
                    
                    localObject2 = new Timestamp(((Date)localObject1).getTime());
                    
                    localObject3 = "" + localObject2;
                    localObject3 = ((String)localObject3).substring(0, 10);
                    txtCashCollDate.setText((String)localObject3);


                  }
                  else if (paramActionEvent.getSource() == btnGetTotalAmount)
                  {
                    localObject1 = getCashCollected(txtCashCollDate.getText());
                    txtCashCollected.setText((String)localObject1); } else { Object localObject17;
                    Object localObject20;
                    if (paramActionEvent.getSource() == btnUploadCouponData)
                    {
                      localObject1 = "";
                      try
                      {
                        localObject2 = (String)cmbConductor.getSelectedItem();
                        localObject2 = ((String)localObject2).trim();
                        
                        int i5 = tblConductorCoupon.getRowCount();
                        int i7 = 0;
                        


                        localObject6 = "";
                        
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        db = DriverManager.getConnection("jdbc:mysql://" + server + ":3306/" + database, username, password);
                        
                        dbmd = db.getMetaData();
                        sql = db.createStatement();
                        


                        localObject7 = db.prepareStatement("select fldv_waybill_no from  tbl_waybill_mst where fldv_conductor_employee_code = '" + (String)localObject2 + "' and fldc_status = 'Y' and fldc_waybill_open_close_status = 'N' order by flddt_date desc limit 0,1");
                        localObject8 = ((PreparedStatement)localObject7).executeQuery();
                        
                        while (((ResultSet)localObject8).next())
                        {
                          localObject6 = ((ResultSet)localObject8).getString(1);
                        }
                        ((ResultSet)localObject8).close();
                        

                        for (int i9 = 0; i9 < i5; i9++)
                        {
                          localObject9 = Boolean.valueOf(true);
                          localObject11 = tblConductorCoupon.getModel().getValueAt(i9, 0);
                          localObject12 = tblConductorCoupon.getModel().getValueAt(i9, 1);
                          localObject13 = tblConductorCoupon.getModel().getValueAt(i9, 2);
                          localObject14 = tblConductorCoupon.getModel().getValueAt(i9, 3);
                          Object localObject16 = tblConductorCoupon.getModel().getValueAt(i9, 4);
                          localObject17 = tblConductorCoupon.getModel().getValueAt(i9, 5);
                          localObject18 = tblConductorCoupon.getModel().getValueAt(i9, 7);
                          


                          try
                          {
                            String str14 = localObject13.toString();
                            localObject20 = localObject14.toString();
                            localObject21 = localObject18.toString();
                            

                            if (!((String)localObject20).equals(""))
                            {
                              i16 = Integer.parseInt((String)localObject20);
                              i17 = Integer.parseInt(str14);
                              int i18 = Integer.parseInt((String)localObject21);
                              
                              if (i16 >= 0)
                              {
                                if ((i16 < i17) && (i16 > 0))
                                {
                                  i7 = 1;
                                  JOptionPane.showMessageDialog(this, "Ticket End Number should be greater than start number", "Ticket Number", 0);
                                  return;
                                }
                                if ((i16 > i18) && (i16 > 0))
                                {
                                  i7 = 1;
                                  JOptionPane.showMessageDialog(this, "Ticket End Number should be less than max number", "Ticket Number", 0);
                                  return;
                                }
                                

                                String str16 = localObject16.toString();
                                
                                if (((String)localObject1).equals(""))
                                {
                                  localObject1 = "('0','','" + (String)localObject2 + "','0','" + localObject12 + "','" + localObject11 + "','" + str14 + "','" + (String)localObject20 + "','" + localObject17 + "','" + str16 + "',NOW(),'N','" + sessId + "',NOW(),'" + (String)localObject6 + "')";
                                }
                                else
                                {
                                  localObject1 = (String)localObject1 + " ," + "('0','','" + (String)localObject2 + "','0','" + localObject12 + "','" + localObject11 + "','" + str14 + "','" + (String)localObject20 + "','" + localObject17 + "','" + str16 + "',NOW(),'N','" + sessId + "',NOW(),'" + (String)localObject6 + "')";






                                }
                                







                              }
                              else
                              {






                                i7 = 1;
                                JOptionPane.showMessageDialog(this, "Ticket Number should be integer", "Ticket Number", 0);
                                return;
                              }
                            }
                          }
                          catch (NumberFormatException localNumberFormatException)
                          {
                            i7 = 1;
                            JOptionPane.showMessageDialog(this, "Ticket Number should be integer", "Ticket Number", 0);
                            return;
                          }
                        }
                        


                        if (i7 == 0)
                        {


                          PreparedStatement localPreparedStatement3 = db.prepareStatement("insert into  tbl_conductor_coupon_collection_dummy (fldi_conductor_id,fldv_conductor_name,fldv_employee_code, fldi_coupon_id,fldv_coupon_blok_no,fldi_coupon_amount,fldi_coupon_start_number,fldi_coupon_end_number,fldv_total_amount,fldi_no_of_tickets,flddt_date,fldc_status,fldi_user_id,flddt_last_upd_date,fldv_waybill_no) values " + (String)localObject1 + " ");
                          localPreparedStatement3.executeUpdate();
                          localPreparedStatement3.close();
                          db.close();
                          JOptionPane.showMessageDialog(this, "Data uploaded successfully...", "Ticket Upload", 0);
                          couponModel.setRowCount(0);
                          
                          btnCouponCollectCash.setEnabled(true);
                        }
                        
                      }
                      catch (Exception localException7)
                      {
                        JOptionPane.showMessageDialog(this, "Error...Please try later", "Conductor", 0);

                      }
                      

                    }
                    else if (paramActionEvent.getSource() == btnCouponCollectCash)
                    {

                      HidePanel();
                      panelHeaderAll.setVisible(true);
                      panelCashCollection.setVisible(true);
                      

                      insertSmsContent(etmNumberValue, "Cash Collection");
                      

                      localObject1 = new Date();
                      
                      Timestamp localTimestamp1 = new Timestamp(((Date)localObject1).getTime());
                      
                      String str8 = "" + localTimestamp1;
                      str8 = str8.substring(0, 10);
                      txtCashCollDate.setText(str8); } else { Object localObject5;
                      Object localObject4;
                      Object localObject10; int i12; Object localObject19; ResultSet localResultSet; if (paramActionEvent.getSource() == btnGetCouponAmount)
                      {
                        btnUploadCouponData.setEnabled(false);
                        btnGetCouponAmount.setEnabled(false);
                        localObject1 = (String)cmbConductor.getSelectedItem();
                        localObject1 = ((String)localObject1).trim();
                        if (!((String)localObject1).equals(""))
                        {
                          int i8;
                          try {
                            int i1 = tblConductorCoupon.getRowCount();
                            for (int i6 = 0; i6 < i1; i6++)
                            {
                              localObject5 = tblConductorCoupon.getModel().getValueAt(i6, 1);
                              localObject6 = tblConductorCoupon.getModel().getValueAt(i6, 2);
                              
                              localObject7 = localObject5.toString();
                              
                              i8 = Integer.parseInt((String)localObject7);
                              
                              localObject9 = localObject6.toString().trim();
                              if (!((String)localObject9).equals(""))
                              {
                                int i10 = Integer.parseInt((String)localObject9);
                                
                                if (i10 > 0)
                                {
                                  if (i10 < i8)
                                  {
                                    JOptionPane.showMessageDialog(this, "Coupon End Number should be greater than start no.", "Coupon Number", 0);
                                    return;
                                  }
                                  
                                }
                                
                              }
                            }
                          }
                          catch (Exception localException8)
                          {
                            JOptionPane.showMessageDialog(this, "Error", "Coupon Number", 0);
                            return;
                          }
                          
                          try
                          {
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            db = DriverManager.getConnection("jdbc:mysql://" + server + ":3306/" + database, username, password);
                            dbmd = db.getMetaData();
                            sql = db.createStatement();
                            
                            int i2 = tblConductorCoupon.getRowCount();
                            


                            localObject7 = Float.valueOf(0.0F);
                            
                            for (i8 = 0; i8 < i2; i8++)
                            {
                              localObject4 = Float.valueOf(0.0F);
                              localObject5 = Float.valueOf(0.0F);
                              localObject6 = Float.valueOf(0.0F);
                              
                              localObject9 = tblConductorCoupon.getModel().getValueAt(i8, 1);
                              localObject10 = tblConductorCoupon.getModel().getValueAt(i8, 2);
                              localObject11 = tblConductorCoupon.getModel().getValueAt(i8, 0);
                              
                              localObject12 = localObject9.toString();
                              int i11 = Integer.parseInt((String)localObject12);
                              
                              localObject14 = localObject10.toString().trim();
                              i12 = Integer.parseInt((String)localObject14);
                              

                              localObject17 = localObject11.toString();
                              float f = Float.parseFloat((String)localObject17);
                              

                              localObject19 = db.prepareStatement("SELECT sum(((fldi_coupon_end_number -  fldi_coupon_next_number)+1)) as totobal FROM tbl_coupon_allocation_data WHERE fldv_employee_code = '" + (String)localObject1 + "' and fldc_coupon_completed = 'N' and fldc_status = 'Y'  and fldi_coupon_amount = '" + f + "' and fldi_coupon_end_number < '" + i12 + "' group by fldi_coupon_amount");
                              localObject20 = ((PreparedStatement)localObject19).executeQuery();
                              while (((ResultSet)localObject20).next())
                              {
                                localObject4 = Float.valueOf(Float.parseFloat(((ResultSet)localObject20).getString(1)));
                              }
                              ((ResultSet)localObject20).close();
                              
                              localObject21 = db.prepareStatement("SELECT  (sum(('" + i12 + "'- fldi_coupon_next_number)+1)) as totobal1 FROM tbl_coupon_allocation_data WHERE fldv_employee_code = '" + (String)localObject1 + "' and fldc_coupon_completed = 'N' and fldc_status = 'Y'  and fldi_coupon_amount = '" + f + "' and ('" + i12 + "' between fldi_coupon_start_number and fldi_coupon_end_number) group by fldi_coupon_amount");
                              localResultSet = ((PreparedStatement)localObject21).executeQuery();
                              while (localResultSet.next())
                              {
                                localObject5 = Float.valueOf(Float.parseFloat(localResultSet.getString(1)));
                              }
                              localResultSet.close();
                              
                              localObject6 = Float.valueOf(((Float)localObject4).floatValue() + ((Float)localObject5).floatValue());
                              localObject7 = Float.valueOf(((Float)localObject7).floatValue() + f * ((Float)localObject6).floatValue());
                              
                              tblConductorCoupon.getModel().setValueAt(localObject6, i8, 3);
                              tblConductorCoupon.getModel().setValueAt(Float.valueOf(f * ((Float)localObject6).floatValue()), i8, 4);
                            }
                            
                            txtTotalCouponCollection.setText("" + localObject7);
                            calculateTotalFare();
                            db.close();
                            btnUploadCouponData.setEnabled(true);
                          }
                          catch (Exception localException9)
                          {
                            localException9.printStackTrace();
                          }
                        }
                        
                        btnGetCouponAmount.setEnabled(true);
                        btnUploadCouponData.setEnabled(true);
                      }
                      else if (paramActionEvent.getSource() == btnGetConductorCoupon)
                      {
                        couponModel.setRowCount(0);
                        txtTotalCouponCollection.setText("");
                        btnCouponCollectCash.setEnabled(false);
                        localObject1 = (String)cmbConductor.getSelectedItem();
                        localObject1 = ((String)localObject1).trim();
                        if (!((String)localObject1).equals(""))
                        {
                          try
                          {
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            db = DriverManager.getConnection("jdbc:mysql://" + server + ":3306/" + database, username, password);
                            
                            dbmd = db.getMetaData();
                            sql = db.createStatement();
                            


                            PreparedStatement localPreparedStatement2 = db.prepareStatement("SELECT a.fldi_coupon_allocation_id,a.fldv_coupon_blok_no,a.fldi_coupon_next_number,a.fldi_coupon_amount,b.fldv_nutrition_tax,fldi_coupon_end_number FROM tbl_coupon_allocation_data as a,tbl_coupon_amount_mst as b WHERE a.fldi_coupon_amt_id = b.fldi_coupon_amt_id and a.fldi_coupon_amount = b.fldi_coupon_amount and a.fldv_employee_code = '" + (String)localObject1 + "' and a.fldc_coupon_completed = 'N' order by a.fldi_coupon_amount,a.fldi_coupon_start_number");
                            
                            localObject4 = localPreparedStatement2.executeQuery();
                            while (((ResultSet)localObject4).next())
                            {
                              localObject5 = ((ResultSet)localObject4).getString(3);
                              localObject6 = "0";
                              













                              localObject6 = ((ResultSet)localObject4).getString(3);
                              
                              couponModel.addRow(new Object[] { ((ResultSet)localObject4).getString(4), ((ResultSet)localObject4).getString(2), ((ResultSet)localObject4).getString(3), localObject6, "0", "0.0", ((ResultSet)localObject4).getString(5), ((ResultSet)localObject4).getString(6) });
                            }
                            ((ResultSet)localObject4).close();
                            db.close();



                          }
                          catch (Exception localException10) {}


                        }
                        else
                        {

                          JOptionPane.showMessageDialog(this, "Please select the conductor", "Conductor", 0);
                        }
                      }
                      else if (paramActionEvent.getSource() == btnCauculateAmount)
                      {
                        try
                        {
                          localObject1 = "";
                          String str6 = "";
                          localObject4 = "";
                          localObject5 = "";
                          localObject6 = "";
                          localObject7 = "";
                          String str10 = "";
                          localObject9 = "";
                          localObject10 = "";
                          localObject11 = "";
                          localObject12 = "";
                          
                          String str12 = txtWayData.getText();
                          str12 = str12.replaceAll("[$]", "");
                          str12 = str12.trim();
                          
                          localObject14 = (String)cmbConductor.getSelectedItem();
                          

                          if ((!str12.equals("")) || (!((String)localObject14).equals("Emp Code")))
                          {
                            i12 = 0;
                            
                            localObject17 = new Date();
                            Timestamp localTimestamp2 = new Timestamp(((Date)localObject17).getTime());
                            
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            db = DriverManager.getConnection("jdbc:mysql://" + server + ":3306/" + database, username, password);
                            
                            dbmd = db.getMetaData();
                            sql = db.createStatement();
                            


                            if (!str12.equals(""))
                            {
                              localObject1 = str12.substring(0, 7);
                              str6 = str12.substring(7, 17);
                              localObject4 = str12.substring(17, 27);
                              localObject5 = str12.substring(27, 37);
                              localObject6 = str12.substring(37, 46);
                              localObject7 = str12.substring(46, 48);
                              str10 = str12.substring(48, 57);
                              localObject9 = str12.substring(57, 59);
                              localObject10 = str12.substring(59, 63);
                              localObject11 = str12.substring(63, 66);
                              localObject12 = str12.substring(66, 82);

                            }
                            else
                            {

                              localObject19 = db.prepareStatement("select fldv_waybill_no,fldv_conductor_employee_code,fldv_driver_employee_code,fldv_vehicle_number,fldv_division_name,fldv_division_code,fldv_depot_name, \tfldv_depot_code,fldv_schedule,fldv_etm_number,flddt_date from  tbl_waybill_mst where fldv_conductor_employee_code = '" + (String)localObject14 + "' and fldc_status = 'Y' and fldc_waybill_open_close_status = 'N' order by flddt_date desc limit 0,1");
                              
                              localObject20 = ((PreparedStatement)localObject19).executeQuery();
                              
                              while (((ResultSet)localObject20).next())
                              {
                                localObject1 = ((ResultSet)localObject20).getString(1);
                                str6 = ((ResultSet)localObject20).getString(2);
                                localObject4 = ((ResultSet)localObject20).getString(3);
                                localObject5 = ((ResultSet)localObject20).getString(4);
                                localObject6 = ((ResultSet)localObject20).getString(5);
                                localObject7 = ((ResultSet)localObject20).getString(6);
                                str10 = ((ResultSet)localObject20).getString(7);
                                localObject9 = ((ResultSet)localObject20).getString(8);
                                localObject10 = ((ResultSet)localObject20).getString(9);
                                localObject11 = ((ResultSet)localObject20).getString(10);
                                localObject12 = ((ResultSet)localObject20).getString(11);
                              }
                              ((ResultSet)localObject20).close();
                            }
                            

                            if (!((String)localObject1).equals(""))
                            {

                              localObject19 = txtCashCollDate.getText().trim();
                              localObject20 = "";
                              


                              localObject21 = db.prepareStatement("select fldi_conductor_collection_id,fldv_waybill_no from tbl_conductor_collection_amount where fldv_waybill_no = '" + (String)localObject1 + "' and fldv_etm_number = '" + (String)localObject11 + "' and fldv_vehicle_number = '" + (String)localObject5 + "' and fldv_collection_date = '" + (String)localObject19 + "'");
                              localResultSet = ((PreparedStatement)localObject21).executeQuery();
                              while (localResultSet.next())
                              {
                                i12 = 1;
                                localObject20 = localResultSet.getString(1);
                              }
                              
                              PreparedStatement localPreparedStatement4;
                              
                              if (i12 == 1)
                              {
                                localPreparedStatement4 = db.prepareStatement("update tbl_conductor_collection_amount set fldv_waybill_no=?,fldv_conductor_name=?,fldv_driver_name=?,fldv_vehicle_number=?,fldv_division_name=?,fldv_division_code=?,fldv_depot_name=?,fldv_depot_code=?,fldv_schedule=?,fldv_etm_number=?,flddt_collection_date=now(),fldv_collection_1000_count=?,fldf_collection_1000_amt=?,fldv_collection_500_count=?,fldf_collection_500_amt=?,fldv_collection_100_count=?,fldf_collection_100_amt=?,fldv_collection_50_count=?,fldf_collection_50_amt=?, fldv_collection_20_count=?,fldf_collection_20_amt=?,fldv_collection_10_count=?, fldf_collection_10_amt=?,fldv_collection_5_count=?,fldf_collection_5_amt=?,fldv_collection_2_count=?,fldf_collection_2_amt=?,fldv_collection_1_count=?,fldf_collection_1_amt=?,fldv_collection_10_ps_count=?,fldf_collection_10_ps_amt=?,fldv_collection_5_ps_count=?,fldf_collection_5_ps_amt=?,fldv_collection_2_ps_count=?,fldf_collection_2_ps_amt=?,fldv_collection_1_ps_count=?,fldf_collection_1_ps_amt=?,fldv_collection_5ps_ps_count=?,fldf_collection_5ps_ps_amt=?,fldf_collection_total_amt=?,fldv_collection_date=?,fldc_status=?,fldi_user_id=?,flddt_last_upd_date=now() where fldi_conductor_collection_id = '" + (String)localObject20 + "'");
                              }
                              else
                              {
                                localPreparedStatement4 = db.prepareStatement("insert into tbl_conductor_collection_amount (fldv_waybill_no,fldv_conductor_name,fldv_driver_name,fldv_vehicle_number,fldv_division_name,fldv_division_code,fldv_depot_name,fldv_depot_code,fldv_schedule,fldv_etm_number,flddt_collection_date,fldv_collection_1000_count,fldf_collection_1000_amt,fldv_collection_500_count,fldf_collection_500_amt,fldv_collection_100_count,fldf_collection_100_amt,fldv_collection_50_count,fldf_collection_50_amt, fldv_collection_20_count,fldf_collection_20_amt,fldv_collection_10_count, fldf_collection_10_amt,fldv_collection_5_count,fldf_collection_5_amt,fldv_collection_2_count,fldf_collection_2_amt,fldv_collection_1_count,fldf_collection_1_amt,fldv_collection_10_ps_count,fldf_collection_10_ps_amt,fldv_collection_5_ps_count,fldf_collection_5_ps_amt,fldv_collection_2_ps_count,fldf_collection_2_ps_amt,fldv_collection_1_ps_count,fldf_collection_1_ps_amt,fldv_collection_5ps_ps_count,fldf_collection_5ps_ps_amt,fldf_collection_total_amt,fldv_collection_date,fldc_status,fldi_user_id,flddt_last_upd_date) values(?,?,?,?,?,?,?,?,?,?,NOW(),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,NOW())");
                              }
                              
                              localPreparedStatement4.setString(1, (String)localObject1);
                              localPreparedStatement4.setString(2, str6);
                              localPreparedStatement4.setString(3, (String)localObject4);
                              localPreparedStatement4.setString(4, (String)localObject5);
                              localPreparedStatement4.setString(5, (String)localObject6);
                              localPreparedStatement4.setString(6, (String)localObject7);
                              localPreparedStatement4.setString(7, str10);
                              localPreparedStatement4.setString(8, (String)localObject9);
                              localPreparedStatement4.setString(9, (String)localObject10);
                              localPreparedStatement4.setString(10, (String)localObject11);
                              
                              localPreparedStatement4.setString(11, txtPC1000.getText().trim());
                              localPreparedStatement4.setString(12, txtPA1000.getText().trim());
                              localPreparedStatement4.setString(13, txtPC1500.getText().trim());
                              localPreparedStatement4.setString(14, txtPA1500.getText().trim());
                              localPreparedStatement4.setString(15, txtPC100.getText().trim());
                              localPreparedStatement4.setString(16, txtPA100.getText().trim());
                              localPreparedStatement4.setString(17, txtPC50.getText().trim());
                              localPreparedStatement4.setString(18, txtPA50.getText().trim());
                              localPreparedStatement4.setString(19, txtPC20.getText().trim());
                              localPreparedStatement4.setString(20, txtPA20.getText().trim());
                              localPreparedStatement4.setString(21, txtPC10.getText().trim());
                              localPreparedStatement4.setString(22, txtPA10.getText().trim());
                              localPreparedStatement4.setString(23, txtPC5.getText().trim());
                              localPreparedStatement4.setString(24, txtPA5.getText().trim());
                              localPreparedStatement4.setString(25, txtPC2.getText().trim());
                              localPreparedStatement4.setString(26, txtPA2.getText().trim());
                              localPreparedStatement4.setString(27, txtPC1.getText().trim());
                              localPreparedStatement4.setString(28, txtPA1.getText().trim());
                              localPreparedStatement4.setString(29, txtPCs10.getText().trim());
                              localPreparedStatement4.setString(30, txtPCsA10.getText().trim());
                              localPreparedStatement4.setString(31, txtPCs5.getText().trim());
                              localPreparedStatement4.setString(32, txtPCsA5.getText().trim());
                              localPreparedStatement4.setString(33, txtPCs2.getText().trim());
                              localPreparedStatement4.setString(34, txtPCsA2.getText().trim());
                              localPreparedStatement4.setString(35, txtPCs1.getText().trim());
                              localPreparedStatement4.setString(36, txtPCsA1.getText().trim());
                              localPreparedStatement4.setString(37, txtPCs05.getText().trim());
                              localPreparedStatement4.setString(38, txtPCsA05.getText().trim());
                              localPreparedStatement4.setString(39, txtTotalAmtCol.getText().trim());
                              localPreparedStatement4.setString(40, txtCashCollDate.getText().trim());
                              localPreparedStatement4.setString(41, "Y");
                              
                              localPreparedStatement4.setInt(42, sessId);
                              
                              localPreparedStatement4.executeUpdate();
                              localPreparedStatement4.close();
                              db.close();
                              
                              JOptionPane.showMessageDialog(this, "Data Uploaded Successfully", "Collection Data", 0);
                              cmbConductor.setSelectedIndex(0);
                              clearCollectionData();
                            }
                            else
                            {
                              JOptionPane.showMessageDialog(this, "Waybill not generated for this conductor", "Collection Data", 0);
                              cmbConductor.setSelectedIndex(0);
                              clearCollectionData();
                            }
                            
                          }
                        }
                        catch (Exception localException5)
                        {
                          JOptionPane.showMessageDialog(this, "Error..Please try later.", "Error", 0);
                        }
                      }
                    }
                  }
                }
              }
            }
          } } } } }
  
  public void clearCollectionData() { txtPA1000.setText("0.0");
    txtPA1500.setText("0.0");
    txtPA100.setText("0.0");
    txtPA50.setText("0.0");
    txtPA20.setText("0.0");
    txtPA10.setText("0.0");
    txtPA5.setText("0.0");
    txtPA2.setText("0.0");
    txtPA1.setText("0.0");
    txtPCsA10.setText("0.0");
    txtPCsA5.setText("0.0");
    txtPCsA2.setText("0.0");
    txtPCsA1.setText("0.0");
    txtPCsA05.setText("0.0");
    txtTotalAmtCol.setText("0.0");
    txtAmtDifference.setText("0.0");
    txtPC1000.setText("");
    txtPC1500.setText("");
    txtPC100.setText("");
    txtPC50.setText("");
    txtPC20.setText("");
    txtPC10.setText("");
    txtPC5.setText("");
    txtPC2.setText("");
    txtPC1.setText("");
    txtPCs10.setText("");
    txtPCs5.setText("");
    txtPCs2.setText("");
    txtPCs1.setText("");
    txtPCs05.setText("");
    txtTotalCouponCollection.setText("");
    txtData.setText("");
    txtWayData.setText("");
    txtSmartCardData.setText("");
    txtTotalCollection.setText("");
    txtCashCollected.setText("");
    txtAmtDifference.setText("");
    txtTotalTopupCollection.setText("");
    txtTotalTicketCollection.setText("");
  }
  













  public void insertSmsContent(String paramString1, String paramString2) {}
  












  public void getConductorDetails()
  {
    try
    {
      Class.forName("com.mysql.jdbc.Driver").newInstance();
      db = DriverManager.getConnection("jdbc:mysql://" + server + ":3306/" + database, username, password);
      
      dbmd = db.getMetaData();
      sql = db.createStatement();
      
      PreparedStatement localPreparedStatement = db.prepareStatement("select fldi_conductor_id,fldv_conductor_name,fldv_employee_code  from tbl_conductor_mst where fldc_status = 'Y' order by fldv_employee_code");
      ResultSet localResultSet = localPreparedStatement.executeQuery();
      cmbConductor.addItem("Emp Code");
      while (localResultSet.next())
      {
        cmbConductor.addItem(localResultSet.getString(3));
      }
      localResultSet.close();
      db.close();
    }
    catch (Exception localException) {}
  }
  


  public String getCashCollected(String paramString)
  {
    cashCollected = "0";
    
    try
    {
      String str = paramString.trim();
      if (!str.equals(""))
      {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        db = DriverManager.getConnection("jdbc:mysql://" + server + ":3306/" + database, username, password);
        
        dbmd = db.getMetaData();
        sql = db.createStatement();
        
        PreparedStatement localPreparedStatement = db.prepareStatement("select round( sum(fldi_ticket_fare)/100) as totalFare from tbl_trip_ticket_details where flddt_ticket_date = '" + str + "'");
        ResultSet localResultSet = localPreparedStatement.executeQuery();
        while (localResultSet.next())
        {
          cashCollected = localResultSet.getString(1);
          if ((cashCollected.equals("")) || (cashCollected.equals(null)))
          {
            cashCollected = "0";
          }
        }
        localResultSet.close();
        db.close();
      }
    }
    catch (Exception localException) {}
    





    return cashCollected;
  }
  

  public static void main(String[] paramArrayOfString)
  {
    run(new DataVoice(), 500, 300);
  }
  
  public static void run(JApplet paramJApplet, int paramInt1, int paramInt2)
  {
    JFrame localJFrame = new JFrame("Data Voice");
    localJFrame.setDefaultCloseOperation(3);
    localJFrame.getContentPane().add(paramJApplet);
    localJFrame.setSize(paramInt1, paramInt2);
    paramJApplet.init();
    paramJApplet.start();
    localJFrame.setVisible(true);
  }
}
