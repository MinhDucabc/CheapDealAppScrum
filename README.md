# 📱 CheapDeal Mobile App

A mobile application built for modern Android operating systems (e.g., Android 10+) to allow users to browse and purchase mobile and broadband packages. The app also improves communication between customers and Customer Service Representatives (CSRs).

---

## 🧾 Description
This mobile app is designed to:
- Sell package combinations (mobile devices + broadband options)
- Facilitate customer account management
- Enhance CSR support and interaction

## 🚀 Features
### 👤 Customer Management & Interaction
- User login and registration
- Profile creation and editing
- Submit enquiries
- Change password
- Configure payment method and credit card number

### 📦 Package Browsing & Order Processing
- Browse default and custom packages
- View and select bundle deals (e.g., DoublePackage, TriplePackage)
- Place orders via the app
- Auto-calculate totals with applicable discounts or offer codes

### 🧑‍💼 CRM & Sales Support
- CSR access to customer profiles and package data
- Caller verification support
- Respond to customer enquiries
- Process payments
- Profile customers and send targeted special offers via app

## 📦 Installation
### 1. Install XAMPP  
👉 [Download XAMPP](https://www.apachefriends.org/download.html)

### 2. Clone the GitHub Repository
```bash
# Go to htdocs directory of XAMPP
cd /path-to-xampp/htdocs

# Clone this repository
git clone https://github.com/MinhDucabc/CheapDealAppScrum.git
```

### 3. Start MySQL Server

Open **XAMPP**, then:

- Click **Start** on the **MySQL** module  
  ![Apache Start](readme_assets/image-2.png)


- Click **Admin** to open the database interface  
  ![Apache Admin](readme_assets/image-3.png)

- Once in DataBase Interface, Click on **Import** and choose the **cheapdeals_scrum.sql** file to load the whole database
  ![image](https://github.com/user-attachments/assets/2c63d69c-6c1b-45fc-89c6-ea0db3310ada)
  ![image](https://github.com/user-attachments/assets/9bea143c-7f5f-464a-be11-206d5cc3eb20)

---

### 4. Start Apache Server

- In **XAMPP**, click **Start** on the **Apache** module
- ![MySQL Start](readme_assets/image.png)

- Click **Admin** to launch the browser and preview the project by accessing the cloned `CheapDealAppScrum` folder  
- ![MySQL Admin](readme_assets/image-1.png)

---

## ❓ FAQ

**Q: Why does the browser show `Undefined variable $pdo in C:...`?**  
**A:** You must start the **MySQL Server** in XAMPP **before** loading the application in the browser to ensure database connectivity.

![PDO Error Example 1](readme_assets/image-3.png)  
![PDO Error Example 2](readme_assets/image-4.png)

---

## 💻 Technology Stack

- **Frontend:** HTML, CSS, JavaScript, TailwindCSS  
- **Backend:** PHP  
- **Database:** MySQL  
- **Collaboration Tool:** Git  

---

## 🖼️ Screenshots

### 🔐 Login & Signup Pages
- **Login Page:** Allows registered users to sign into their accounts.  
  ![Login Page](readme_assets/login.png)

- **Sign Up Page:** New users can register by providing their personal and payment information.  
  ![SignUp Page](readme_assets/signup.png)

---

### 👤 Profile Page
- View and edit user details such as name, email, address, and credit card info.  
  ![Profile Page](readme_assets/profile.png)

---

### 🏠 Homepage
- Dashboard view displaying available packages, deals, and quick navigation.  
  ![HomePage](readme_assets/homepage.png)
- Additional view showcasing dynamic content or featured promotions.  
  ![HomePage](readme_assets/homepage1.png)

---

### 📦 Package Pages
- Browse all available packages: MobileOnly, TabletOnly, BroadbandOnly, and custom deals.  
  ![Packages](readme_assets/packages.png)
- Additional layout for package selection or filtering options.  
  ![Packages](readme_assets/packages1.png)

---

### 📦 Package Detail / 💼 Deal Detail
- Detailed view of a selected package, showing included features and pricing.  
  ![Package Details](readme_assets/package-details.png)

- Detailed view of a selected deal, including bunch of specific packages with discount.  
  ![Deal Details](readme_assets/deal-details.png)

---

### 🛒 Cart & Checkout
- Cart displays selected packages, quantities, and running total.  
  ![Cart](readme_assets/cart.png)

- Final checkout screen for order review and credit card payment.  
  ![Checkout](readme_assets/checkout.png)

---

### 🗂️ Database Design
- ERD (Entity Relationship Diagram) showing how customer, package, order, CSR data and much more are related in the system.  
  ![Database Design](readme_assets/database-design.png)

