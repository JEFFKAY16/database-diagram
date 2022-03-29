CREATE DATABASE clinic_database;

CREATE TABLE medical_histories(
    ID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP,
    patient_id INT,
    status VARCHAR(30)
);

CREATE TABLE patients(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(30),
    date_of_birth DATE
);

ALTER TABLE
    medical_histories
ADD
    CONSTRAINT patient_id FOREIGN KEY(patient_id) REFERENCES patients(id);

CREATE TABLE treatments(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    type VARCHAR(30),
    name VARCHAR(30)
);

CREATE TABLE invoices (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT,
    FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT,
    FOREIGN KEY(invoice_id) REFERENCES invoices(id),
    FOREIGN KEY(treatment_id) REFERENCES treatments(id)
);

-- FK INDEXES
CREATE INDEX patient_id_medical_histories_idx ON medical_histories(patient_id);

CREATE INDEX medical_history_id_invoice_items_idx ON invoice_items(medical_history_id);

CREATE INDEX invoice_id_invoice_items_idx ON invoice_items(invoice_id);

CREATE INDEX treatment_id_invoice_items_idx ON invoice_items(treatment_id);

CREATE INDEX treatment_id_invoices_idx ON invoices(treatment_id);

CREATE INDEX treatment_id_medical_histories_idx ON medical_histories(treatment_id);
