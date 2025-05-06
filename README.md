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
![Login Page](readme_assets/login.png)
![SignUp Page](readme_assets/signup.png)

### 👤 Profile Page
![Profile Page](readme_assets/profile.png)

### 🏠 Homepage
![HomePage](readme_assets/homepage.png)
![HomePage](readme_assets/homepage1png)

### 📦 Package Pages
![Packages](readme_assets/packages.png)  
![Packages](readme_assets/packages1.png)  


### 📦 Package Detail / 💼 Deal Detail
![Package Details](readme_assets/package-details.png)
![Deal Details](readme_assets/deal-details.png)

### 🛒 Cart & Checkout
![Cart](readme_assets/cart.png)  
![Checkout](readme_assets/checkout.png)

### 🗂️ Database Design
![Database Design](readme_assets/database-design.png)
