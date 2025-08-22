# eshopper
eShopper is a Flutter-based **E-Commerce application** built using **GetX** for state management, navigation, and dependency injection.  
It provides a seamless shopping experience with **token-based authentication**, product browsing, cart, wishlist, and order management features.  
# Features
* **Authentication**- Token-based login system for secure access.
- 🏠 **Home Page**
  - Displays a **list of products**.
  - Integrated **search bar** to search products by name.
  - Product categories displayed for easy navigation.

- 📂 **Categories**
  - Browse products by categories.
  - Each category dynamically displays related products.

- 🛒 **Cart**
  - Add products to the shopping cart.
  - View cart items before checkout.

- ❤️ **Favourites**
  - Save favourite products for quick access later.

- 📦 **My Orders**
  - View past orders placed by the user.

- 🔀 **Navigation**
  - Managed using **GetX Navigation** for smooth transitions.

- ⚙️ **Dependency Injection**
  - All controllers and services managed with **GetX DI**.
# Tech Stack
- **Framework:** Flutter  
- **State Management & Navigation:** GetX  
- **Backend API:** Dummy API (with token authentication)  
- **Language:** Dart
# Project Structure
```lib/
├── app/
│ ├── core/ # Constants, themes, utilities
│ ├── data/ # API services, models
│ ├── modules/
│ │ ├── auth/ # Login & authentication
│ │ │ ├── bindings/
│ │ │ ├── controllers/
│ │ │ └── views/
│ │ ├── home/ # Home screen & product list
│ │ │ ├── bindings/
│ │ │ ├── controllers/
│ │ │ └── views/
│ │ ├── category/ # Category-related screens
│ │ │ ├── bindings/
│ │ │ ├── controllers/
│ │ │ └── views/
│ │ ├── cart/ # Add to cart, checkout
│ │ │ ├── bindings/
│ │ │ ├── controllers/
│ │ │ └── views/
│ │ ├── favourite/ # Wishlist/favourites
│ │ │ ├── bindings/
│ │ │ ├── controllers/
│ │ │ └── views/
│ │ ├── orders/ # My orders
│ │ │ ├── bindings/
│ │ │ ├── controllers/
│ │ │ └── views/
│ │ └── product/ # Product details
│ │ ├── bindings/
│ │ ├── controllers/
│ │ └── views/
│ └── routes/ # App routes using GetX
└── main.dart

