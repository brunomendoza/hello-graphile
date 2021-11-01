\c graphile

BEGIN;

CREATE SCHEMA graphile_internal;
CREATE SCHEMA graphile_public;

CREATE TABLE graphile_internal.student (
    id bigserial,
    first_name varchar(50) NULL,
    last_name varchar(50) NULL,
    birthdate date NULL DEFAULT current_date,
    CONSTRAINT student_pk PRIMARY KEY (id)
);

CREATE TABLE graphile_internal.subject (
    id bigserial,
    name varchar(50) NOT NULL,
    CONSTRAINT subject_pk PRIMARY KEY (id)
);

CREATE TABLE graphile_internal.student_subject (
    student_id bigint NOT NULL,
    subject_id bigint NOT NULL,
    CONSTRAINT student_subject_pk PRIMARY KEY (student_id, subject_id),
    CONSTRAINT subject_student_fk FOREIGN KEY (student_id)
        REFERENCES graphile_internal.student(id),
    CONSTRAINT student_subject_fk FOREIGN KEY (subject_id)
        REFERENCES graphile_internal.subject(id)
);


INSERT INTO graphile_internal.student (first_name, last_name)
VALUES
('john', 'doe'),
('jane', 'doe');

INSERT INTO graphile_internal.subject (name)
VALUES
('mathematics'),
('geography'),
('history');

INSERT INTO graphile_internal.student_subject (student_id, subject_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2);

COMMIT;