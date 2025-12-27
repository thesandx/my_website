# My Jaspr Website

Welcome to your new Jaspr project! This README provides a comprehensive guide to understanding the codebase and how Jaspr works.

## 🚀 Getting Started

### Prerequisites

Make sure you have the [Jaspr CLI](https://pub.dev/packages/jaspr_cli) installed:

```bash
dart pub global activate jaspr_cli
```

### Running the Project

Run your project in development mode with hot-reload:

```bash
jaspr serve
```

The development server will be available on `http://localhost:8080`.

### Building the Project

Build your project for production:

```bash
jaspr build
```

The output will be located inside the `build/jaspr/` directory.

---

## 🏗️ Project Structure

Here is an overview of the most important files and directories:

-   **`lib/`**: Contains the Dart source code for your application.
    -   **`main.server.dart`**: The entrypoint for the server environment. It handles the initial SSR/SSG (Server-Side Rendering / Static Site Generation) and defines the base HTML structure (`Document`).
    -   **`main.client.dart`**: The entrypoint for the browser environment.
    -   **`app.dart`**: The root component of your application. It uses the `@client` annotation, meaning it runs on both the server (for initial render) and the client (for interactivity).
    -   **`pages/`**: Contains the different pages/routes of your website (e.g., `home.dart`, `about.dart`).
    -   **`components/`**: Reusable UI components (e.g., `counter.dart`).
    -   **`constants/`**: App-wide constants like themes and colors.
-   **`web/`**: Static assets like images, icons, and CSS files.
-   **`pubspec.yaml`**: Project configuration and dependencies. Note the `jaspr: mode: static` setting, which configures the project for static site generation.

---

## 💡 Key Jaspr Concepts in This Project

### 1. Unified Rendering
Jaspr allows you to write components that run on both the server and the client.
-   **Server-side**: The `Document` in `main.server.dart` defines the `<html>`, `<head>`, and `<body>`.
-   **Client-side**: Components marked with `@client` (like `App` in `app.dart`) become interactive once loaded in the browser.

### 2. Components
Everything in Jaspr is a `Component`.
-   **StatelessComponent**: For static UI parts.
-   **StatefulComponent**: For UI parts that change (like the `Counter` component). Use `setState()` to trigger updates.

### 3. Type-Safe CSS-in-Dart
This project uses Jaspr's CSS-in-Dart support. Instead of separate `.css` files, styles are defined directly in Dart using the `@css` annotation. This provides:
-   Type safety for CSS properties.
-   Scoped styles (by using specific selectors).
-   Seamless integration with component logic.

Check `lib/app.dart` or `lib/components/counter.dart` for examples.

### 4. HTML Domain-Specific Language (DSL)
Jaspr provides a Dart-friendly way to write HTML. Instead of `<div>Hello</div>`, you write `div([text('Hello')])`. These functions are imported from `package:jaspr/dom.dart`.

---

## 🔧 Configuration

The project behavior is defined in `pubspec.yaml`:

```yaml
jaspr:
  mode: static # Options: static, server, client
```

-   **`static`**: Generates a static site (SSG).
-   **`server`**: Enables full SSR with a Dart server.
-   **`client`**: Pure client-side rendering (SPA).

---

## 📚 Learn More

-   [Jaspr Documentation](https://docs.getjaspr.dev)
-   [Jaspr GitHub Repository](https://github.com/schultek/jaspr)
