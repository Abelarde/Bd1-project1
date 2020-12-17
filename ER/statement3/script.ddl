
CREATE TABLE complexion (
    idcomplexion  INTEGER NOT NULL,
    nombre        VARCHAR2(255)
);

ALTER TABLE complexion ADD CONSTRAINT complexion_pk PRIMARY KEY(idcomplexion);

CREATE TABLE denuncia (
    iddenuncia                   INTEGER NOT NULL,
    fechadenuncia                DATE NOT NULL,
    fechadesaparacion            DATE NOT NULL,
    denunciante_iddenunciante    INTEGER NOT NULL,
    desaparecido_iddesaparecido  INTEGER NOT NULL
);

ALTER TABLE denuncia ADD CONSTRAINT denuncia_pk PRIMARY KEY(iddenuncia);
ALTER TABLE denuncia
    ADD CONSTRAINT denuncia_denunciante_fk FOREIGN KEY ( denunciante_iddenunciante )
        REFERENCES denunciante ( iddenunciante);
ALTER TABLE denuncia
    ADD CONSTRAINT denuncia_desaparecido_fk FOREIGN KEY ( desaparecido_iddesaparecido )
        REFERENCES desaparecido ( iddesaparecido);


CREATE TABLE denunciante (
    iddenunciante  INTEGER NOT NULL,
    nombre         VARCHAR2(255) NOT NULL,
    adn            VARCHAR2(255) NOT NULL
);

ALTER TABLE denunciante ADD CONSTRAINT denunciante_pk PRIMARY KEY(iddenunciante);


CREATE TABLE departamento (
    iddepartamento  INTEGER NOT NULL,
    nombre          VARCHAR2(255) NOT NULL
);

ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY(iddepartamento);

CREATE TABLE desaparecido (
    iddesaparecido  INTEGER NOT NULL,
    nombre          VARCHAR2(255) NOT NULL,
    apellido        VARCHAR2(255) NOT NULL,
    profesion       VARCHAR2(255),
    edad            INTEGER NOT NULL,
    altura          INTEGER,
    etnia_idednia   INTEGER NOT NULL
);

ALTER TABLE desaparecido ADD CONSTRAINT desaparecido_pk PRIMARY KEY(iddesaparecido);
ALTER TABLE desaparecido
    ADD CONSTRAINT desaparecido_etnia_fk FOREIGN KEY ( etnia_idednia )
        REFERENCES etnia ( idednia);

CREATE TABLE desaparecido_complexion (
    desaparecido_iddesaparecido  INTEGER NOT NULL,
    complexion_idcomplexion      INTEGER NOT NULL,
    color                        VARCHAR2(255)
);
ALTER TABLE desaparecido_complexion
    ADD CONSTRAINT desaparecido_complexion_complexion_fk FOREIGN KEY ( complexion_idcomplexion )
        REFERENCES complexion ( idcomplexion);
ALTER TABLE desaparecido_complexion
    ADD CONSTRAINT desaparecido_complexion_desaparecido_fk FOREIGN KEY ( desaparecido_iddesaparecido )
        REFERENCES desaparecido ( iddesaparecido);


CREATE TABLE etnia (
    idednia  INTEGER NOT NULL,
    nombre   VARCHAR2(255) NOT NULL
);

ALTER TABLE etnia ADD CONSTRAINT etnia_pk PRIMARY KEY(idednia);

CREATE TABLE irreconocido (
    idirreconocido               INTEGER NOT NULL,
    adn                          VARCHAR2(255),
    alturacalculada              INTEGER,
    edadcalculada                INTEGER NOT NULL,
    departamento_iddepartamento  INTEGER NOT NULL
);

ALTER TABLE irreconocido ADD CONSTRAINT irreconocido_pk PRIMARY KEY(idirreconocido);
ALTER TABLE irreconocido
    ADD CONSTRAINT irreconocido_departamento_fk FOREIGN KEY ( departamento_iddepartamento )
        REFERENCES departamento ( iddepartamento);

CREATE TABLE irreconocido_objeto (
    caracteristica               VARCHAR2(255) NOT NULL,
    irreconocido_idirreconocido  INTEGER NOT NULL,
    objeto_idobjeto              INTEGER NOT NULL
);
ALTER TABLE irreconocido_objeto
    ADD CONSTRAINT irreconocido_objeto_irreconocido_fk FOREIGN KEY ( irreconocido_idirreconocido )
        REFERENCES irreconocido ( idirreconocido);
ALTER TABLE irreconocido_objeto
    ADD CONSTRAINT irreconocido_objeto_objeto_fk FOREIGN KEY ( objeto_idobjeto )
        REFERENCES objeto ( idobjeto);


CREATE TABLE objeto (
    idobjeto  INTEGER NOT NULL,
    nombre    VARCHAR2(255) NOT NULL
);

ALTER TABLE objeto ADD CONSTRAINT objeto_pk PRIMARY KEY(idobjeto);

CREATE TABLE victima (
    idvictima                    INTEGER NOT NULL,
    nombre                       VARCHAR2(255) NOT NULL,
    apellido                     VARCHAR2(255) NOT NULL,
    edad                         INTEGER,
    fechanacimiento              DATE,
    telefono                     INTEGER,
    residenciaactual             VARCHAR2(255),
    departamento_iddepartamento  INTEGER NOT NULL
);

ALTER TABLE victima ADD CONSTRAINT victima_pk PRIMARY KEY(idvictima);
ALTER TABLE victima
    ADD CONSTRAINT victima_departamento_fk FOREIGN KEY ( departamento_iddepartamento )
        REFERENCES departamento ( iddepartamento);















