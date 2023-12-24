# Swadharma Duta Data Project

## Case 1: Aplikasi Mobile App Pembayaran QRIS

- Home Page
  <br/> Displays current balance, top up button (50k for each tap)
  <br/> Button to navigate to QRScanner Page
  <br/> Utilize **CoreData** to store transaction history and **UserDefaults** to store balance
- QR Scanner Page
  <br/> Automatically navigate to result page if QR found
- Result Page
  <br/> Shows result of QR Scanner value
- Success Page
  <br/> Confirmation if transaction success

## Case 2: Aplikasi Mobile App Promo

- Home Page
  <br/> \*<i>**Promo API Error**, replaced with **User API**</i>

## Case 3: Aplikasi Mobile App Portfolio

- Home Page
  <br/> Uses [**DGCharts**](https://github.com/danielgindi/Charts) for displaying charts
  <br/> Displays line chart and dounit chart, if one of the donut chart's component tapped, it will navigate to the transaction details page
- Chart's detail page
  <br/> Displays transaction details

## Case 4: Aplikasi Mobile PUSH Notif

Uses FCM to display push notification. If the app goes to background, the app will send payload (predefined in Case Study Instruction) to Firebase then Firebase will send the notif to the device with the same device token. The app will show the notification. If the notification tapped, it will navigate to another page displaying the payload. Otherwise, it will stay in the home page.
