# 🍔 Burger Queen — Application mobile Flutter

Application mobile Flutter simulant l'interface de commande en ligne d'un restaurant de burgers. Elle présente les différentes catégories du menu : burgers, accompagnements, boissons et desserts.

> Travail pratique du module **Développement Web — Partie Mobile**
> **ENSA Khouribga** — Filière Ingénierie Informatique et Data (IID) — Année universitaire 2024–2025

**Réalisé par :** Zineb Laarousi & Fadwa Ouarchane
**Encadré par :** Pr. Rabhi Loubna

---

## 📑 Sommaire

1. [Aperçu](#-aperçu)
2. [Partie I — Installation et configuration de Flutter](#-partie-i--installation-et-configuration-de-flutter)
3. [Partie II — Développement de l'application](#-partie-ii--développement-de-lapplication)
4. [Lancer le projet](#-lancer-le-projet)
5. [Conclusion et pistes d'amélioration](#-conclusion-et-pistes-damélioration)

---

## 📱 Aperçu

| Chrome | Émulateur Pixel 7a (accueil) | Émulateur Pixel 7a (menu) |
|:---:|:---:|:---:|
| ![Chrome](screenshots/chrome.png) | ![Accueil](screenshots/accueil.png) | ![Menu](screenshots/menu.png) |

---

## 🧰 Partie I — Installation et configuration de Flutter

Flutter est un framework open-source de Google qui permet de créer des applications mobiles (Android et iOS), web et desktop à partir d'un unique code source écrit en **Dart**. Cette partie décrit l'installation de l'environnement sous **Windows**.

### Étape 1 — Extraction du SDK Flutter

Télécharger le SDK depuis [flutter.dev](https://flutter.dev) (channel **stable**) et l'extraire dans `C:\src\flutter`.

> Ce chemin évite les répertoires protégés de Windows (comme `Program Files`) qui peuvent provoquer des erreurs de permissions. Éviter aussi tout espace ou caractère spécial dans le chemin.

### Étape 2 — Variables d'environnement

Ajouter `C:\src\flutter\bin` à la variable système **Path** :

1. Panneau de configuration → Système → Paramètres système avancés
2. Bouton « Variables d'environnement »
3. Variables système → sélectionner `Path` → Modifier
4. Ajouter `C:\src\flutter\bin`
5. Valider et redémarrer le terminal

### Étape 3 — Vérification avec `flutter doctor`

```bash
flutter doctor
```

Cet outil analyse l'environnement et indique pour chaque composant s'il est correctement installé (✓), à configurer (✗) ou avec un avertissement (!).

### Étape 4 — Licences Android SDK

```bash
flutter doctor --android-licenses
```

Accepter toutes les licences (`y`) jusqu'au message `All SDK package licenses accepted`. Sans cela, l'erreur *« Some Android licenses not accepted »* apparaît à la compilation.

### Étape 5 — Android Studio

Android Studio (IDE officiel Android, basé sur IntelliJ IDEA) fournit le **SDK Android** et l'**émulateur (AVD)**.
Version utilisée : **Android Studio Panda 4 (2025.3.4 Patch 1)**. Prévoir au moins 8 Go d'espace disque et 8 Go de RAM.

### Étape 6 — Configuration du SDK Android

`File → Settings → Languages & Frameworks → Android SDK`

- **SDK Platforms :** Android 16.0 (« Baklava ») — API Level 36.1
- **SDK Tools :**
  - Android SDK Build-Tools : compilation des APK et AAB
  - Android Emulator Hypervisor Driver : accélération matérielle de l'émulateur
  - Android SDK Platform-Tools : ADB (Android Debug Bridge)

### Étape 7 — Plugin Flutter

- **Android Studio :** `File → Settings → Plugins → Marketplace` → rechercher « Flutter » (Dart Code / Google)
- **VS Code :** panneau Extensions (`Ctrl+Shift+X`) → rechercher « Flutter » (extension officielle vérifiée ✓)

### ✅ Récapitulatif

- Flutter SDK extrait dans `C:\src\flutter`
- Variables d'environnement PATH configurées
- Android Studio Panda 4 avec SDK Android 16.0 (Baklava)
- Licences Android SDK acceptées
- Plugin Flutter installé dans VS Code et Android Studio
- `flutter doctor` validé

---

## 🍔 Partie II — Développement de l'application

### Objectif pédagogique

Mettre en œuvre les concepts fondamentaux de Flutter et Dart : organisation d'un projet, gestion des assets statiques, widgets de mise en page avancés (`GridView`, `ListView`, `Stack`) et déploiement sur émulateur Android.

### Outils utilisés

| Outil | Version / détail | Rôle |
|---|---|---|
| Flutter SDK | 3.44.0 — channel stable | Framework principal |
| Dart | Inclus avec Flutter | Langage de programmation |
| Visual Studio Code | Dernière version stable | Éditeur de code |
| Android Studio | Panda 4 — 2025.3.4 Patch 1 | SDK et émulateur |
| Émulateur Android | Pixel 7a — Android 17.0 (API 37) | Cible de test Android |
| Google Chrome | Dernière version stable | Test en mode web |

### Création du projet

```bash
flutter create burger_queen
```

Cette commande génère `lib/main.dart`, les dossiers `android/`, `ios/`, `web/` et le fichier `pubspec.yaml`.

### Préparation des assets

Les **19 images** fournies par l'encadrante sont placées dans `assets/images/`, puis déclarées dans `pubspec.yaml` :

```yaml
flutter:
  assets:
    - assets/images/
```

Après modification du `pubspec.yaml`, exécuter obligatoirement :

```bash
flutter pub get
```

### Structure de l'application

L'application est organisée autour d'un unique fichier `lib/main.dart`. Le widget racine est un `MaterialApp` (thème `Color(0xFFE91E8C)`) enveloppant un `Scaffold`. La page utilise un `SingleChildScrollView` + `Column` pour le défilement vertical, avec **7 sections** :

| Section | Widget principal | Description |
|---|---|---|
| AppBar | `AppBar` | Icône cloche, titre « Burger Queen » centré, icône profil |
| Restaurant | `Container` + `ElevatedButton` | Localisation (4 kms), bouton *Commander* arrondi |
| En ce moment | `Stack` + `Image.asset` | Image burger avec texte superposé |
| Chaud devant | `GridView.builder` (2 col.) | Twins, Big Queen, Egg Bacon, Prince, Cheese |
| Accompagnements | `ListView.builder` (vertical) | Frites, Patate douce, Poutine, Potatoes |
| Boissons | `ListView.builder` (horizontal) | 4 boissons en défilement horizontal |
| Desserts | `GridView.builder` (2×2) | Glace Oreo, Crêpe Fraise, Donut, Cupcake |

### Widgets et éléments techniques

| Widget / Classe | Rôle dans l'application |
|---|---|
| `MaterialApp` | Application racine avec thème de couleur global |
| `Scaffold` + `SingleChildScrollView` + `Column` | Structure principale avec défilement vertical |
| `GridView.builder` | Grille 2 colonnes (`crossAxisCount: 2`) pour burgers et desserts |
| `ListView.builder` | Liste verticale (accompagnements) et horizontale (boissons) |
| `Stack` + `Image.asset` | Superposition de texte sur une image |
| `ElevatedButton` + `RoundedRectangleBorder` | Bouton *Commander* avec coins arrondis |
| `ClipRRect` | Coins arrondis des images (`BorderRadius.circular`) |
| `Container` + `BoxDecoration` | Fonds colorés et décoration des sections |

`GridView` convient aux affichages en grille à taille d'item uniforme, tandis que `ListView` est plus adapté aux listes linéaires, verticales ou horizontales.

### Tests et résultats

- **Chrome** (`flutter run -d chrome`) : test rapide de l'affichage, du chargement des assets et du défilement, sans lancer l'émulateur.
- **Émulateur Pixel 7a** : profil matériel 6.1 pouces (1080×2400), image système Android 17.0 (API 37), 2048 MB de RAM, 2048 MB de stockage interne. Déploiement via `flutter run` ; le **Hot Reload** (touche `r`) applique les modifications sans redémarrer l'application.

Les deux tests ont été concluants : toutes les images se chargent et la mise en page est fidèle au modèle fourni.

---

## 🚀 Lancer le projet

```bash
# 1. Cloner le dépôt
git clone https://github.com/fadwa-oua/burger-queen-flutter.git
cd burger-queen-flutter

# 2. Installer les dépendances
flutter pub get

# 3. Lancer l'application
flutter run -d chrome     # test rapide sur Chrome
flutter run               # émulateur / appareil Android connecté
```

## 📂 Structure du projet

```
burger_queen/
├── assets/
│   └── images/          # 19 images
├── lib/
│   └── main.dart        # Code principal de l'application
├── android/ ios/ web/ ...
├── pubspec.yaml         # Configuration, dépendances et assets
└── README.md
```

---

## 🔭 Conclusion et pistes d'amélioration

Ce TP couvre tout le cycle de développement Flutter : de la configuration de l'environnement au déploiement d'une application fonctionnelle sur émulateur Android, en passant par la gestion des assets via `pubspec.yaml`, l'architecture en widgets composables et le système de mise en page flexible de Flutter.

Pistes pour aller plus loin :

- Navigation multi-pages (Navigator 2.0 / GoRouter)
- Gestion d'état avancée (Provider, Riverpod, Bloc)
- Intégration d'une API REST (`http` ou `Dio`)
- Authentification utilisateur (Firebase Auth, JWT)
- Publication sur Google Play Store et App Store

## 👩‍💻 Auteures

- **Zineb Laarousi**
- **Fadwa Ouarchane**

Projet à but pédagogique — ENSA Khouribga.
