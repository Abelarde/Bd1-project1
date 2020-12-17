
CREATE TABLE areas (
    idareas  INTEGER NOT NULL,
    nombre   VARCHAR2(255 CHAR) NOT NULL
);

ALTER TABLE areas ADD CONSTRAINT areas_pk PRIMARY KEY ( idareas);

CREATE TABLE cliente (
    idcliente        INTEGER NOT NULL,
    nombre           VARCHAR2(255 CHAR) NOT NULL,
    apellido         VARCHAR2(255 CHAR) NOT NULL,
    cui              INTEGER NOT NULL,
    fechanacimiento  DATE,
    telefono         INTEGER NOT NULL,
    direccion        VARCHAR2(255 CHAR),
    edad             INTEGER,
    correo           VARCHAR2(255 CHAR) NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( idcliente);

CREATE TABLE contrato (
    idcontrato         INTEGER NOT NULL,
    cliente_idcliente  INTEGER NOT NULL
);

ALTER TABLE contrato ADD CONSTRAINT contrato_pk PRIMARY KEY ( idcontrato);

CREATE TABLE departamento (
    iddepartamento  INTEGER NOT NULL,
    nombre          INTEGER NOT NULL,
    areas_idareas   INTEGER NOT NULL
);

ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY ( iddepartamento);
ALTER TABLE contrato
    ADD CONSTRAINT contrato_cliente_fk FOREIGN KEY(cliente_idcliente )
        REFERENCES cliente ( idcliente);

ALTER TABLE departamento
    ADD CONSTRAINT departamento_areas_fk FOREIGN KEY(areas_idareas )
        REFERENCES areas ( idareas);

ALTER TABLE funcion
    ADD CONSTRAINT funcion_departamento_fk FOREIGN KEY(departamento_iddepartamento )
        REFERENCES departamento ( iddepartamento);

ALTER TABLE historialllamada
    ADD CONSTRAINT historialllamada_cliente_fk FOREIGN KEY(cliente_idcliente )
        REFERENCES cliente ( idcliente);

ALTER TABLE historialllamada
    ADD CONSTRAINT historialllamada_personal_fk FOREIGN KEY(personal_idpersonal )
        REFERENCES personal ( idpersonal);

 
ALTER TABLE historiallllamada_seguro
    ADD CONSTRAINT historiallllamada_seguro_historialllamada_fk FOREIGN KEY(historialllamada_idregistrollamada )
        REFERENCES historialllamada ( idregistrollamada);

 
ALTER TABLE historiallllamada_seguro
    ADD CONSTRAINT historiallllamada_seguro_polizadeseguro_fk FOREIGN KEY(polizadeseguro_idpolizadeseguro )
        REFERENCES polizadeseguro ( idpolizadeseguro);

ALTER TABLE personal
    ADD CONSTRAINT personal_departamento_fk FOREIGN KEY(departamento_iddepartamento )
        REFERENCES departamento ( iddepartamento);



CREATE TABLE formasdepago (
    idformasdepago  INTEGER NOT NULL,
    nombre          VARCHAR2(255 CHAR) NOT NULL
);

ALTER TABLE formasdepago ADD CONSTRAINT formasdepago_pk PRIMARY KEY ( idformasdepago);

CREATE TABLE funcion (
    idfuncion                    INTEGER NOT NULL,
    nombre                       VARCHAR2(255 CHAR) NOT NULL,
    departamento_iddepartamento  INTEGER
);

ALTER TABLE funcion ADD CONSTRAINT funcion_pk PRIMARY KEY ( idfuncion);

CREATE TABLE historialllamada (
    idregistrollamada    INTEGER NOT NULL,
    fechahora            DATE NOT NULL,
    duracion             NUMBER(8, 2),
    numero               INTEGER NOT NULL,
    personal_idpersonal  INTEGER NOT NULL,
    cliente_idcliente    INTEGER NOT NULL
);

ALTER TABLE historialllamada ADD CONSTRAINT historialllamada_pk PRIMARY KEY ( idregistrollamada);

CREATE TABLE historiallllamada_seguro ( 
) 
         historialllamada_idregistrollamada  INTEGER NOT NULL, 
) 
         polizadeseguro_idpolizadeseguro     INTEGER
    NOT NULL
);
ALTER TABLE personal
    ADD CONSTRAINT personal_personal_fk FOREIGN KEY(personal_idpersonal )
        REFERENCES personal ( idpersonal);

ALTER TABLE personal
    ADD CONSTRAINT personal_puesto_fk FOREIGN KEY(puesto_idpuesto )
        REFERENCES puesto ( idpuesto);



CREATE TABLE papeleria (
    idpapeleria  INTEGER NOT NULL,
    nombre       VARCHAR2(255 CHAR) NOT NULL
);

ALTER TABLE papeleria ADD CONSTRAINT papeleria_pk PRIMARY KEY ( idpapeleria);
ALTER TABLE polizadeseguro_papeleria
    ADD CONSTRAINT polizadeseguro_papeleria_polizadeseguro_fk FOREIGN KEY(polizadeseguro_idpolizadeseguro )
        REFERENCES polizadeseguro ( idpolizadeseguro);

 
ALTER TABLE polizadeseguro
    ADD CONSTRAINT polizadeseguro_periododepago_fk FOREIGN KEY(periododepago_idperiododepago )
        REFERENCES periododepago ( idperiododepago);

ALTER TABLE registropago
    ADD CONSTRAINT registropago_cliente_fk FOREIGN KEY(cliente_idcliente )
        REFERENCES cliente ( idcliente);

 
ALTER TABLE registropago_formadepago
    ADD CONSTRAINT registropago_formadepago_formasdepago_fk FOREIGN KEY(formasdepago_idformasdepago )
        REFERENCES formasdepago ( idformasdepago);

 
ALTER TABLE registropago_formadepago
    ADD CONSTRAINT registropago_formadepago_registropago_fk FOREIGN KEY(registropago_idregistropago )
        REFERENCES registropago ( idregistropago);

ALTER TABLE registropago
    ADD CONSTRAINT registropago_personal_fk FOREIGN KEY(personal_idpersonal )
        REFERENCES personal ( idpersonal);

CREATE TABLE periododepago (
    idperiododepago  INTEGER NOT NULL,
    nombre           VARCHAR2(255 CHAR) NOT NULL
);

ALTER TABLE periododepago ADD CONSTRAINT periododepago_pk PRIMARY KEY ( idperiododepago);

CREATE TABLE personal (
    idpersonal                   INTEGER NOT NULL,
    nombre                       VARCHAR2(255 CHAR) NOT NULL,
    apellido                     VARCHAR2(255 CHAR) NOT NULL,
    dpi                          INTEGER NOT NULL,
    fechanacimiento              DATE,
    fechainiciolaboral           DATE NOT NULL,
    edad                         INTEGER,
    telefono                     INTEGER,
    direccion                    VARCHAR2(255 CHAR),
    salario                      INTEGER,
    puesto_idpuesto              INTEGER NOT NULL,
    departamento_iddepartamento  INTEGER NOT NULL,
    personal_idpersonal          INTEGER
);

ALTER TABLE personal ADD CONSTRAINT personal_pk PRIMARY KEY ( idpersonal);
ALTER TABLE polizadeseguro
    ADD CONSTRAINT polizadeseguro_contrato_fk FOREIGN KEY(contrato_idcontrato )
        REFERENCES contrato ( idcontrato);

 
ALTER TABLE polizadeseguro_papeleria
    ADD CONSTRAINT polizadeseguro_papeleria_papeleria_fk FOREIGN KEY(papeleria_idpapeleria )
        REFERENCES papeleria ( idpapeleria);

CREATE TABLE polizadeseguro (
    idpolizadeseguro               INTEGER NOT NULL,
    nombre                         VARCHAR2(255 CHAR) NOT NULL,
    fechainicioseguro              DATE NOT NULL,
    fechafinalseguro               DATE,
    monto                          NUMBER(10, 2) NOT NULL,
    contrato_idcontrato            INTEGER NOT NULL,
    periododepago_idperiododepago  INTEGER NOT NULL
);

ALTER TABLE polizadeseguro ADD CONSTRAINT polizadeseguro_pk PRIMARY KEY ( idpolizadeseguro);

CREATE TABLE polizadeseguro_papeleria ( 
) 
         polizadeseguro_idpolizadeseguro  INTEGER NOT NULL,
    papeleria_idpapeleria            INTEGER NOT NULL
);

CREATE TABLE puesto (
    idpuesto  INTEGER NOT NULL,
    nombre    VARCHAR2(255 CHAR) NOT NULL
);

ALTER TABLE puesto ADD CONSTRAINT puesto_pk PRIMARY KEY ( idpuesto);

CREATE TABLE registropago (
    idregistropago       INTEGER NOT NULL,
    monto                NUMBER(10, 2) NOT NULL,
    mora                 NUMBER(10, 2),
    fechadepago          DATE NOT NULL,
    cliente_idcliente    INTEGER NOT NULL,
    personal_idpersonal  INTEGER NOT NULL
);

ALTER TABLE registropago ADD CONSTRAINT registropago_pk PRIMARY KEY ( idregistropago);

CREATE TABLE registropago_formadepago (
    registropago_idregistropago  INTEGER NOT NULL,
    formasdepago_idformasdepago  INTEGER NOT NULL
);

CREATE TABLE registropago_polizadeseguro (
    registropago_idregistropago      INTEGER NOT NULL, 
) 
         polizadeseguro_idpolizadeseguro  INTEGER NOT NULL
);

ALTER TABLE registropago_polizadeseguro
    ADD CONSTRAINT registropago_polizadeseguro_polizadeseguro_fk FOREIGN KEY(polizadeseguro_idpolizadeseguro )
        REFERENCES polizadeseguro ( idpolizadeseguro);

 
ALTER TABLE registropago_polizadeseguro
    ADD CONSTRAINT registropago_polizadeseguro_registropago_fk FOREIGN KEY(registropago_idregistropago )
        REFERENCES registropago ( idregistropago);

