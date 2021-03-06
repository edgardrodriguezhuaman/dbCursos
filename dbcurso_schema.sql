-- Crear base de datos dbpizzeria
CREATE DATABASE dbcurso
DEFAULT CHARACTER SET utf8;
-- Poner en uso dbBoletaNota
USE dbcurso;
-- Ver cual es la base de datos en uso
SELECT DATABASE();
SHOW TABLES;
-- Crear tablas

CREATE TABLE HISTORICO
(
IDHIS INT,
DNIPER CHAR(8),
FECFINHIST DATE,
TIPHIS CHAR(3),
COMEHIST VARCHAR (100),
CONSTRAINT IDHIS_PK PRIMARY KEY (IDHIS)
);
CREATE TABLE PERSONA
(
DNIPER CHAR(8),
NOMPER VARCHAR(50),
APEPER VARCHAR(80),
FECNACPER DATE,
CELPER CHAR(9),
EMAPER VARCHAR(100),
SEXPER CHAR(1),
TIPPER CHAR(3),
DISTPER VARCHAR(80),
FECREGPER TIMESTAMP,
PWSPER VARCHAR(20),
CONSTRAINT DNIPER_PK PRIMARY KEY (DNIPER)
);
CREATE TABLE DEPARTAMENTO 
(
IDDEP INT,
NOMDEP VARCHAR (50),
DNIPER CHAR(8),
SALJEFDEP DECIMAL(8,2),
CONSTRAINT IDDEP_PK PRIMARY KEY (IDDEP)
);
CREATE TABLE EMPLEADO
(
IDEMP INT,
DNIPER CHAR(8),
FECINGEMP DATE,
CARGEMP VARCHAR(40),
SALEMP DECIMAL(6,2),
IDDEP INT,
ESTEMP CHAR(1),
CONSTRAINT IDEMP_PK PRIMARY KEY (IDEMP)
);
CREATE TABLE INSCRIPCION
(
IDINSC INT,
DNIPER CHAR(8),
IDEMP INT,
IDOFER INT,
FECINS DATE,
EVALINSC INT,
CONSTRAINT IDINSC_PK PRIMARY KEY (IDINSC)
);
CREATE TABLE OFERTA
(
IDOFER INT,
CODCUR CHAR(3),
FECOFER DATE,
FECINICCUROFER DATE,
IDEMP INT,
CONSTRAINT IDOFER_PK PRIMARY KEY (IDOFER)
);
CREATE TABLE CURSO
(
CODCUR CHAR(3),
DESCUR VARCHAR(30),
CATCUR CHAR(3),
DURCUR INT,
CONSTRAINT CODCUR_PK PRIMARY KEY (CODCUR)
);

-- Crear relaciones entre las tablas
ALTER TABLE HISTORICO
ADD CONSTRAINT PERSONA_HISTORICO_DNIPER
FOREIGN KEY (DNIPER) REFERENCES PERSONA (DNIPER);

ALTER TABLE DEPARTAMENTO
ADD CONSTRAINT PERSONA_DEPARTAMENTO_DNIPER
FOREIGN KEY (DNIPER) REFERENCES PERSONA(DNIPER);

ALTER TABLE EMPLEADO
ADD CONSTRAINT PERSONA_EMPLEADO_DNIPER
FOREIGN KEY (DNIPER) REFERENCES PERSONA(DNIPER);

ALTER TABLE EMPLEADO
ADD CONSTRAINT DEPARTAMENTO_EMPLEADO_IDDEP
FOREIGN KEY (IDDEP) REFERENCES DEPARTAMENTO(IDDEP);

ALTER TABLE INSCRIPCION 
ADD CONSTRAINT PERSONA_INSCRIPCION_DNIPER
FOREIGN KEY (DNIPER) REFERENCES PERSONA(DNIPER);

ALTER TABLE INSCRIPCION
ADD CONSTRAINT EMPLEADO_INSCRIPCION_IDEMP
FOREIGN KEY (IDEMP) REFERENCES EMPLEADO(IDEMP);

ALTER TABLE OFERTA
ADD CONSTRAINT EMPLEADO_OFERTA_IDEMP
FOREIGN KEY (IDEMP) REFERENCES EMPLEADO(IDEMP);

ALTER TABLE INSCRIPCION
ADD CONSTRAINT OFERTA_INSCRIPCION_IDOFER
FOREIGN KEY (IDOFER) REFERENCES OFERTA(IDOFER);

ALTER TABLE OFERTA
ADD CONSTRAINT CURSO_OFERTA_CODCUR
FOREIGN KEY (CODCUR) REFERENCES CURSO(CODCUR);

-- LISTAR LAS RELACIONES DE TABLAS
SELECT * 
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
WHERE table_schema="dbcurso" 
    AND constraint_type="FOREIGN KEY";
    