CREATE TABLE IF NOT EXISTS user (
    id            BIGINT AUTO_INCREMENT PRIMARY KEY,
    full_name     VARCHAR(100) NOT NULL,
    email         VARCHAR(100) NOT NULL UNIQUE,
    password      VARCHAR(255) NOT NULL,
    phone         VARCHAR(20),
    identity_doc  VARCHAR(50),
    nationality   VARCHAR(50),
    role          ENUM('CLIENT','ADMIN') NOT NULL,
    status        ENUM('ACTIVE','INACTIVE') NOT NULL DEFAULT 'ACTIVE',
    failed_attempts INT NOT NULL DEFAULT 0,
    locked_until  DATETIME
);

CREATE TABLE IF NOT EXISTS package (
    id                  BIGINT AUTO_INCREMENT PRIMARY KEY,
    name                VARCHAR(100) NOT NULL,
    destination         VARCHAR(100) NOT NULL,
    description         TEXT NOT NULL,
    start_date          DATE NOT NULL,
    end_date            DATE NOT NULL,
    price               DECIMAL(10,2) NOT NULL,
    total_spots         INT NOT NULL,
    available_spots     INT NOT NULL,
    included_services   TEXT,
    conditions          TEXT,
    category            VARCHAR(50),
    status              ENUM('AVAILABLE','SOLD_OUT','NOT_VALID','CANCELLED') NOT NULL DEFAULT 'AVAILABLE'
);

CREATE TABLE IF NOT EXISTS reservation (
    id                  BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id             BIGINT NOT NULL,
    package_id          BIGINT NOT NULL,
    passenger_count     INT NOT NULL,
    reservation_date    DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    special_requests    TEXT,
    base_amount         DECIMAL(10,2) NOT NULL,
    discount_applied    DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    final_amount        DECIMAL(10,2) NOT NULL,
    discount_detail     TEXT,
    status              ENUM('PENDING','CONFIRMED','CANCELLED') NOT NULL DEFAULT 'PENDING',
    FOREIGN KEY (user_id)    REFERENCES user(id),
    FOREIGN KEY (package_id) REFERENCES package(id)
);

CREATE TABLE IF NOT EXISTS payment (
    id                  BIGINT AUTO_INCREMENT PRIMARY KEY,
    reservation_id      BIGINT NOT NULL UNIQUE,
    amount              DECIMAL(10,2) NOT NULL,
    payment_date        DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    payment_method      ENUM('CREDIT_CARD') NOT NULL DEFAULT 'CREDIT_CARD',
    card_number         VARCHAR(16),
    expiration_date     VARCHAR(7),
    cvv                 VARCHAR(4),
    FOREIGN KEY (reservation_id) REFERENCES reservation(id)
);

CREATE TABLE IF NOT EXISTS promotion (
    id                  BIGINT AUTO_INCREMENT PRIMARY KEY,
    name                VARCHAR(100) NOT NULL,
    discount_percentage DECIMAL(5,2) NOT NULL,
    start_date          DATE NOT NULL,
    end_date            DATE NOT NULL,
    active              BOOLEAN NOT NULL DEFAULT true
);
