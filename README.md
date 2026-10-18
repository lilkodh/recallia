<div align="center">

# 🧠 Recallia
### *A Local-First Personal Memory Companion*

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.13-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Riverpod](https://img.shields.io/badge/State-Riverpod%203-0D9488)](https://riverpod.dev)
[![Node.js](https://img.shields.io/badge/Node.js-LTS-339933?logo=nodedotjs&logoColor=white)](https://nodejs.org)
[![TypeScript](https://img.shields.io/badge/TypeScript-7.0-3178C6?logo=typescript&logoColor=white)](https://www.typescriptlang.org)
[![Fastify](https://img.shields.io/badge/Fastify-5.x-000000?logo=fastify&logoColor=white)](https://fastify.dev)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-17-4169E1?logo=postgresql&logoColor=white)](https://www.postgresql.org)
[![Drizzle ORM](https://img.shields.io/badge/ORM-Drizzle-C5F74F?logo=drizzle&logoColor=black)](https://orm.drizzle.team)
[![Docker](https://img.shields.io/badge/Docker-Compose-2496ED?logo=docker&logoColor=white)](https://docker.com)
[![License](https://img.shields.io/badge/License-Private-slate)]()

<br/>

> **"You don't need to remember where you saved something. Recallia remembers for you."**  
> Photos, videos, places, and moments — automatically discovered on your device, preserved with privacy-first SQLite, and seamlessly synchronized to your private cloud.

</div>

---

## 📖 Table of Contents
- [✨ Core Capabilities](#-core-capabilities)
- [🏗️ Architectural Philosophy (FFCA & DDD)](#️-architectural-philosophy-ffca--ddd)
- [🛠️ Technology Stack & Justification](#️-technology-stack--justification)
- [📂 Repository Structure](#-repository-structure)
- [🔄 The Ingestion & Sync Pipeline](#-the-ingestion--sync-pipeline)
- [🚀 Getting Started](#-getting-started)
  - [1. Infrastructure Setup](#1-infrastructure-setup)
  - [2. Backend Ingestion Service](#2-backend-ingestion-service)
  - [3. Mobile Application](#3-mobile-application)
- [🛡️ Privacy & Reliability Guarantees](#️-privacy--reliability-guarantees)
- [🗺️ Future Roadmap](#️-future-roadmap)

---

## ✨ Core Capabilities

* 🔒 **Local-First Privacy Architecture**  
  Zero forced cloud lock-in. Media metadata is discovered, indexed, and stored directly on-device in a relational SQLite database powered by Drift. The app works 100% offline.
* ⚡ **Declarative Navigation (`go_router`)**  
  Built on Flutter's modern declarative router with `StatefulShellRoute.indexedStack`. Each bottom navigation tab (`/home`, `/memories`, `/people`, `/privacy`) preserves its own independent navigation stack and scroll position without screen reload.
* 📸 **Paginated Native Hardware Discovery**  
  Direct platform channel integration with iOS PhotoKit and Android MediaStore using `photo_manager`. Batches queries in pages of 100 to index tens of thousands of media files without out-of-memory crashes.
* 🔄 **Resilient, Idempotent Cloud Synchronization**  
  Opt-in cloud sync featuring bitwise exponential backoff retries (`1s, 2s, 4s`) on the mobile client, paired with PostgreSQL compound unique constraints (`onConflictDoNothing`) on the backend to eliminate duplicates.
* 🧩 **Modular Clean Architecture & DDD**  
  Strict layer separation (Domain $\to$ Application $\to$ Data $\to$ Presentation). Domain entities and business use cases remain completely independent of UI frameworks and database drivers.

---

## 🏗️ Architectural Philosophy (FFCA & DDD)

Recallia is structured using **Feature-First Clean Architecture (FFCA)** combined with **Domain-Driven Design (DDD)** and **Hexagonal Architecture (Ports and Adapters)**.

```
                           ┌───────────────────────────────────────────────┐
                           │          MOBILE CLIENT (Flutter)              │
                           │                                               │
                           │  Presentation Layer                           │
                           │  [HomeScreen] [MemoriesScreen] [PrivacyScreen]│
                           │           │                     │             │
                           │           ▼                     ▼             │
                           │  Application Layer (Use Cases)                │
                           │  [DiscoverDeviceAssets]   [SyncDeviceAssets]  │
                           │           │                     │             │
                           │           ▼                     ▼             │
                           │  Domain Layer (Pure Entities & Interfaces)    │
                           │  [DeviceAsset]         [DeviceAssetRepo]      │
                           │           ▲                     ▲             │
                           │           │ (Implements)        │ (Implements)│
                           │  Data / Infrastructure Layer                  │
                           │  [PhotoConnector]       [DriftSQLiteRepo]     │
                           └───────────────────┬───────────────────────────┘
                                               │ HTTP POST (Dio)
                                               │ Exponential Backoff
                                               ▼
                           ┌───────────────────────────────────────────────┐
                           │       INGESTION SERVICE (Node.js/Fastify)     │
                           │                                               │
                           │  Presentation: Fastify Routes + Zod Validation│
                           │                       │                       │
                           │  Application:  RegisterIngestionItem Use Case │
                           │                       │                       │
                           │  Domain:       IngestionItem Entity & Repo    │
                           │                       │                       │
                           │  Infrastructure: Drizzle ORM + Connection Pool│
                           └───────────────────┬───────────────────────────┘
                                               │
                                               ▼
                           ┌───────────────────────────────────────────────┐
                           │            INFRASTRUCTURE (Docker)            │
                           │                                               │
                           │  [(PostgreSQL 17)] ─── Relational & Vector DB │
                           │  [(RabbitMQ 4)]    ─── Async Event Bus        │
                           │  [(RustFS S3)]     ─── High-Speed Blob Store  │
                           └───────────────────────────────────────────────┘
```

### The Inward Dependency Rule
* **Domain Layer:** Defines pure business concepts (`DeviceAsset`, `IngestionItem`). Has **zero** dependencies on Flutter, Drift, Fastify, or PostgreSQL.
* **Application Layer:** Orchestrates business use cases. Accepts dependencies via abstract interfaces (Dependency Inversion Principle).
* **Data / Infrastructure Layer:** Concrete adapters fulfilling contracts (e.g., `DriftDeviceAssetRepository` implementing `DeviceAssetRepository`).
* **Presentation Layer:** Renders the user interface or handles HTTP routing. Driven reactively by Riverpod on mobile and Fastify handlers on the backend.

---

## 🛠️ Technology Stack & Justification

### Mobile Frontend (`apps/mobile`)
| Technology | Role | Architectural Justification |
| :--- | :--- | :--- |
| **Flutter 3.x / Dart 3.13** | Cross-Platform Client | Native ahead-of-time (AOT) compilation to ARM64 machine code via Impeller/Skia. Consistent 60/120 FPS performance without JavaScript bridge bottlenecks. |
| **go_router** | Declarative Navigation | Implements `StatefulShellRoute.indexedStack`. Keeps each bottom tab's scroll position and state alive in memory during navigation. |
| **flutter_riverpod 3.x** | Reactive State & DI | Compile-safe global provider graph. Eliminates `BuildContext` dependency and `ProviderNotFoundException`. Easily testable outside the widget tree. |
| **Drift 2.x (SQLite)** | Local Relational Cache | Type-safe SQL query generation, compiled Dart companions, reactive query streams, and automated database schema migrations (`MigrationStrategy`). |
| **photo_manager 3.x** | Gallery Hardware Access | Queries native Android MediaStore and iOS PhotoKit with paginated batching (100 assets/page), avoiding device memory exhaustion. |
| **Dio 5.x** | Resilient HTTP Client | Advanced networking client supporting fine-grained error typing (`DioExceptionType`) and 10-second connect/receive timeouts. |

### Backend Microservices (`services/ingestion`)
| Technology | Role | Architectural Justification |
| :--- | :--- | :--- |
| **Node.js LTS & TypeScript 7** | Runtime & Typing | Non-blocking, event-driven I/O model handles high-concurrency ingestion with sound compile-time type verification. |
| **Fastify 5.x** | High-Throughput API | Up to **3x faster than Express**. Radix-tree URL routing, built-in schema serialization, and an encapsulated plugin model. |
| **Drizzle ORM** | SQL Query Engine | Zero heavy binary engines (unlike Prisma). Generates pristine, lightweight SQL queries with full TypeScript inference and near-native performance. |
| **Zod** | Boundary Validation | Strict runtime validation of incoming HTTP request bodies, rejecting malformed UUIDs or invalid timestamps before reaching use cases. |

### Cloud Infrastructure (`infrastructure`)
| Service | Image | Role |
| :--- | :--- | :--- |
| **PostgreSQL 17** | `postgres:17-alpine` | Relational storage with connection pooling (`pg.Pool`), compound unique indexes for idempotency, and future `pgvector` embedding support. |
| **RabbitMQ 4** | `rabbitmq:4-management-alpine` | Asynchronous message broker decoupling ingestion APIs from CPU-heavy background tasks (OCR, vectorization, transcoding). |
| **RustFS** | `rustfs/rustfs:latest` | High-performance, S3-compatible object storage written in Rust. Keeps binary blobs out of PostgreSQL to prevent database bloat. |

---

## 📂 Repository Structure

```
recallia/
├── apps/
│   └── mobile/                       # Flutter Cross-Platform Client
│       ├── lib/
│       │   ├── core/                 # Shared Cross-Feature Infrastructure
│       │   │   ├── database/         # Drift SQLite DB & Table Schemas
│       │   │   ├── device/           # InstallationIdService (UUID memoization)
│       │   │   ├── navigation/       # app_router.dart (go_router StatefulShell)
│       │   │   ├── network/          # ApiClient (Dio with timeout handling)
│       │   │   ├── providers/        # Global Riverpod DB & Network providers
│       │   │   ├── theme/            # Design tokens (AppColors, AppTextStyles)
│       │   │   └── widgets/          # Reusable atomic UI components
│       │   ├── features/             # Feature-First Modular Architecture
│       │   │   ├── home/             # Home Dashboard & Recent Memories Grid
│       │   │   ├── ingestion/        # Domain, Use Cases, Drift Repo & Connectors
│       │   │   ├── memories/         # Filterable Memory Gallery (Photos/Videos)
│       │   │   ├── navigation/       # MainNavigationScreen & FloatingTabBar
│       │   │   ├── onboarding/       # Onboarding Carousel & Permission Flow
│       │   │   └── settings/         # Privacy & Cloud Sync Preferences
│       │   └── main.dart             # Root bootstrap (ProviderScope + MaterialApp.router)
│       └── pubspec.yaml
│
├── services/
│   └── ingestion/                    # Metadata Ingestion Microservice
│       ├── src/
│       │   ├── domain/               # IngestionItem Entity & Repository Contract
│       │   ├── application/          # RegisterIngestionItem Use Case
│       │   ├── infrastructure/       # Drizzle ORM Repo, Postgres Schema & Pool
│       │   ├── presentation/         # Fastify Routes, Zod Schemas & Handlers
│       │   ├── app.ts                # Fastify composition root
│       │   └── server.ts             # Service launcher (Port 3001)
│       ├── package.json
│       └── tsconfig.json
│
├── infrastructure/
│   ├── docker-compose.yml            # PostgreSQL 17, RabbitMQ 4, RustFS S3
│   └── postgres/migrations/          # Drizzle SQL migration files
│
├── package.json                      # Root workspace configuration
└── drizzle.config.ts                 # Drizzle Kit migration configuration
```

---

## 🔄 The Ingestion & Sync Pipeline

When the user activates cloud synchronization in **Settings**, Recallia triggers a fault-tolerant, idempotent pipeline:

```
[User Toggles Cloud Sync]
         │
         ▼
1. PrivacyDataScreen (_toggleSync)
         │  Writes preference to SharedPreferences
         ▼
2. SyncDeviceAssets.execute() (Use Case)
         │  Step A: Reads assets from local Drift SQLite database
         ▼
3. For Each Asset in SQLite:
         │  Step B: Updates status in SQLite: UPDATE device_assets SET sync_status = 'syncing'
         │  Step C: IngestionApiService formats payload with unique Installation UUID
         ▼
4. Network Transmission (Dio Client):
         │  POST /ingestion/items with 10s connection timeout
         │  If connection drops: Bitwise Exponential Backoff (1s, 2s, 4s) up to 3 retries
         ▼
5. Ingestion Microservice (Fastify):
         │  Zod Schema validates body (UUIDs, ISO dates, enums)
         │  Drizzle executes: INSERT ... ON CONFLICT (deviceId, externalId) DO NOTHING
         │  Returns 201 Created (new asset) OR 200 OK (duplicate safely ignored)
         ▼
6. Mobile Client:
         │  On HTTP success: UPDATE device_assets SET sync_status = 'synced'
         ▼
[Asset Synchronized — Zero Duplicates — Complete Data Consistency]
```

---

## 🚀 Getting Started

### Prerequisites
* **Flutter SDK** (`^3.13.2` or later) & **Dart SDK**
* **Node.js** (`v20+` or `v22+ LTS`) & **npm**
* **Docker** & **Docker Compose**

---

### 1. Infrastructure Setup
Start the local database, message broker, and object storage:

```bash
cd infrastructure
docker compose up -d
```

Verify that all three services are running:
* **PostgreSQL 17:** `localhost:5432`
* **RabbitMQ Management Dashboard:** `http://localhost:15672` (Guest: `guest` / `guest`)
* **RustFS Object Storage Console:** `http://localhost:9001`

---

### 2. Backend Ingestion Service
From the repository root:

```bash
# Install root dependencies
npm install

# Run database migrations
npx drizzle-kit migrate

# Start the ingestion microservice in development mode
npm run dev:ingestion
```

The Fastify ingestion server will start listening at `http://0.0.0.0:3001`.

---

### 3. Mobile Application
Launch the Flutter mobile client on an emulator or physical device:

```bash
cd apps/mobile

# Get dependencies
flutter pub get

# Generate Drift database code (if needed)
dart run build_runner build --delete-conflicting-outputs

# Run the application
flutter run
```

---

## 🛡️ Privacy & Reliability Guarantees

* **Zero Cloud Tracking:** Media is scanned and indexed locally on your physical hardware. Your memories never touch a server unless you explicitly enable Cloud Sync.
* **Idempotent Ingestion:** The compound PostgreSQL index on `(device_id, external_id)` combined with `onConflictDoNothing()` guarantees that retrying an upload never produces duplicate items.
* **Safe State Mutations:** Every asynchronous workflow in Flutter is guarded by `if (!mounted) return;`, eliminating memory leaks and `setState() after dispose()` exceptions.
* **Resource Leak Prevention:** Riverpod's `ref.onDispose()` automatically closes SQLite database handles and releases file locks when services are torn down.

---

## 🗺️ Future Roadmap

- [ ] **On-Device Semantic Search:** Integration with on-device embedding models for offline natural language search.
- [ ] **Cloud Vector Search (`pgvector`):** Hybrid full-text and high-dimensional semantic search over memory captions.
- [ ] **Asynchronous Worker Pipelines:** RabbitMQ consumer workers for background video transcoding, OCR text extraction, and face clustering.
- [ ] **Presigned S3 Media Uploads:** Direct client-to-RustFS binary transfers using time-limited presigned URLs.

---

<div align="center">

**Built with precision, Clean Architecture, and privacy-first engineering.**

</div>
