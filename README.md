# Healthy Nutrition

A cross-platform healthy nutrition tracking app with a Flutter mobile client, a Svelte web frontend, a Node.js backend API, and a deep learning component for food recognition — all powered by MongoDB and deployable via Docker.

🌐 **Live Demo:** [healthy-nutrition-dusky.vercel.app](https://healthy-nutrition-dusky.vercel.app)

## Features

- **Food Recognition** — Camera-based food detection using Google ML Kit image labeling and a custom deep learning model
- **Nutrition Tracking** — Log meals and monitor daily nutritional intake
- **Visual Analytics** — Pie charts and radial gauges to visualize macro/micronutrient breakdowns
- **Calendar View** — Browse and review nutrition history by date
- **Secure Authentication** — JWT-based auth with encrypted local storage via `flutter_secure_storage`
- **Deep Learning** — Jupyter notebook-based model training pipeline for food classification

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Mobile App | Flutter (Dart) |
| Web Frontend | Svelte / JavaScript |
| Backend API | Node.js (JavaScript) |
| Deep Learning | Python, Jupyter Notebook |
| Database | MongoDB |
| DevOps | Docker, Docker Compose |

## Project Structure

```
Healthy-Nutrition/
├── healthy_nutrition/              # Flutter mobile app
├── web/                            # Svelte web frontend
├── Healthy Nutrition Database/     # Node.js backend API
├── Healthy Nutrition Deep Learning/ # Python deep learning model & notebooks
├── docker-compose.yml
└── pubspec.lock
```

## Prerequisites

- [Docker](https://www.docker.com/get-started) and Docker Compose
- [Flutter SDK](https://docs.flutter.dev/get-started/install) >= 3.29.0 (Dart >= 3.8.0)
- [Node.js](https://nodejs.org/) (for local backend development)
- [Python 3](https://www.python.org/) + Jupyter (for deep learning)

## Download & Installation

### Option 1: Clone with Git

```bash
git clone https://github.com/daoduylam2008/Healthy-Nutrition.git
cd Healthy-Nutrition
```

### Option 2: Download ZIP

1. Go to the [repository page](https://github.com/daoduylam2008/Healthy-Nutrition).
2. Click the green **Code** button.
3. Select **Download ZIP**.
4. Extract the ZIP to a folder of your choice.

## Running the Project

### Backend & Database (Docker)

The Node.js backend and MongoDB are managed via Docker Compose.

```bash
docker compose up
```

| Service | URL / Port |
|---------|-----------|
| Node.js Backend | http://localhost:3000 |
| MongoDB | localhost:27018 |

To run with live file sync (auto-updates on code changes):

```bash
docker compose watch
```

To stop all services:

```bash
docker compose down
```

**MongoDB credentials:**
- Username: `root`
- Password: `111111`

### Mobile App (Flutter)

```bash
cd healthy_nutrition
flutter pub get
flutter run
```

> Make sure a device or emulator is running. Use `flutter devices` to check available targets.

### Web Frontend

```bash
cd web
npm install
npm run dev
```

### Deep Learning (Python)

```bash
cd "Healthy Nutrition Deep Learning"
pip install -r requirements.txt   # if a requirements file exists
jupyter notebook
```

## Key Flutter Packages

| Package | Purpose |
|---------|---------|
| `google_mlkit_image_labeling` | On-device food image recognition |
| `camera` | Camera access for food scanning |
| `pie_chart` | Nutritional breakdown charts |
| `syncfusion_flutter_gauges` | Radial gauge visualizations |
| `table_calendar` | Nutrition history calendar |
| `flutter_secure_storage` | Encrypted JWT token storage |
| `shared_preferences` | Local user preferences |
| `http` | API communication |
| `google_fonts` | Custom typography |

## License

This project is licensed under the [MIT License](LICENSE).

## Contributors

- **Lam Dao** — [@daoduylam2008](https://github.com/daoduylam2008)
- **Khoi Pham** — [@Khoipm08](https://github.com/Khoipm08)
