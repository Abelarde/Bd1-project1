
CREATE TABLE asistencia(
    fecha                DATE NOT NULL,
    horainicio           DATE NOT NULL,
    horafin              DATE,
    motivo               VARCHAR2(255),
    empleado_idempleado  INTEGER NOT NULL
);

CREATE TABLE avion(
    idavion       INTEGER NOT NULL,
    modelo        VARCHAR2(255) NOT NULL,
    matricula     VARCHAR2(255) NOT NULL,
    gasolina      INTEGER NOT NULL,
    distanciamax  INTEGER NOT NULL,
    alturamax     INTEGER NOT NULL
);

ALTER TABLE avion ADD CONSTRAINT avion_pk PRIMARY KEY(idavion);

CREATE TABLE avion_clase(
    asientos       INTEGER NOT NULL,
    avion_idavion  INTEGER NOT NULL,
    clase_idclase  INTEGER NOT NULL
);

CREATE TABLE boleto(
    idboleto           INTEGER NOT NULL,
    monto              NUMBER(10, 2) NOT NULL,
    fechaida           DATE,
    fecharegreso       DATE,
    clase_idclase      INTEGER NOT NULL,
    peso               INTEGER NOT NULL,
    fechavalidez       DATE NOT NULL,
    fechainvalidez     DATE NOT NULL,
    factura_idfactura  INTEGER NOT NULL
);

ALTER TABLE boleto ADD CONSTRAINT boleto_pk PRIMARY KEY(idboleto);
ALTER TABLE asistencia
    ADD CONSTRAINT asistencia_empleado_fk FOREIGN KEY(empleado_idempleado )
        REFERENCES empleado(idempleado);

ALTER TABLE avion_clase
    ADD CONSTRAINT avion_clase_avion_fk FOREIGN KEY(avion_idavion )
        REFERENCES avion(idavion);

ALTER TABLE avion_clase
    ADD CONSTRAINT avion_clase_clase_fk FOREIGN KEY(clase_idclase )
        REFERENCES clase(idclase);

ALTER TABLE boleto
    ADD CONSTRAINT boleto_clase_fk FOREIGN KEY(clase_idclase )
        REFERENCES clase(idclase);

ALTER TABLE boleto
    ADD CONSTRAINT boleto_factura_fk FOREIGN KEY(factura_idfactura )
        REFERENCES factura(idfactura);

ALTER TABLE boleto_restriccion
    ADD CONSTRAINT boleto_restriccion_boleto_fk FOREIGN KEY(boleto_idboleto )
        REFERENCES boleto(idboleto);

CREATE TABLE boleto_restriccion(
    boleto_idboleto            INTEGER NOT NULL,
    restriccion_idrestriccion  INTEGER NOT NULL
);

CREATE TABLE boleto_vuelo(
    boleto_idboleto  INTEGER NOT NULL,
    vuelo_idvuelo    INTEGER NOT NULL
);

CREATE TABLE ciudad(
    idciudad  INTEGER NOT NULL,
    nombre    VARCHAR2(255) NOT NULL
);

ALTER TABLE ciudad ADD CONSTRAINT ciudad_pk PRIMARY KEY(idciudad);

CREATE TABLE clase(
    idclase  INTEGER NOT NULL,
    nombre   VARCHAR2(255) NOT NULL
);

ALTER TABLE clase ADD CONSTRAINT clase_pk PRIMARY KEY(idclase);

CREATE TABLE cliente(
    idcliente        INTEGER NOT NULL,
    nombre           VARCHAR2(255) NOT NULL,
    apellido         VARCHAR2(255) NOT NULL,
    edad             INTEGER NOT NULL,
    cui              INTEGER NOT NULL,
    fechanacimiento  DATE NOT NULL,
    correo           VARCHAR2(255),
    telefono         INTEGER,
    direccion        VARCHAR2(255),
    codigopostal     CHAR(7 CHAR),
    nopasaporte      INTEGER NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY(idcliente);

CREATE TABLE empleado(
    idempleado                       INTEGER NOT NULL,
    nombre                           VARCHAR2(255) NOT NULL,
    apellido                         VARCHAR2(255) NOT NULL,
    edad                             INTEGER NOT NULL,
    cui                              INTEGER NOT NULL,
    direccion                        VARCHAR2(255) NOT NULL,
    fechacontratacion                DATE NOT NULL,
    fechanacimiento                  DATE NOT NULL,
    correo                           VARCHAR2(255),
    telefono                         INTEGER,
    horainicioturno                  DATE,
    horafinalturno                   DATE,
    puesto_idpuesto                  INTEGER NOT NULL, 
 
         jornadalaboral_idjornadalaboral  INTEGER
);

ALTER TABLE empleado ADD CONSTRAINT empleado_pk PRIMARY KEY(idempleado);
ALTER TABLE boleto_restriccion
    ADD CONSTRAINT boleto_restriccion_restriccion_fk FOREIGN KEY(restriccion_idrestriccion )
        REFERENCES restriccion(idrestriccion);

ALTER TABLE boleto_vuelo
    ADD CONSTRAINT boleto_vuelo_boleto_fk FOREIGN KEY(boleto_idboleto )
        REFERENCES boleto(idboleto);

ALTER TABLE boleto_vuelo
    ADD CONSTRAINT boleto_vuelo_vuelo_fk FOREIGN KEY(vuelo_idvuelo )
        REFERENCES vuelo(idvuelo);

CREATE TABLE empleado_situacion(
    fecha                  DATE NOT NULL,
    razon                  VARCHAR2(255) NOT NULL,
    situacion_idsituacion  INTEGER NOT NULL,
    empleado_idempleado    INTEGER NOT NULL
);

CREATE TABLE empleado_vuelo(
    empleado_idempleado  INTEGER NOT NULL,
    vuelo_idvuelo        INTEGER NOT NULL
);

CREATE TABLE factura(
    idfactura          INTEGER NOT NULL,
    total              NUMBER(10, 2) NOT NULL,
    cliente_idcliente  INTEGER NOT NULL
);

ALTER TABLE factura ADD CONSTRAINT factura_pk PRIMARY KEY(idfactura);
ALTER TABLE empleado
    ADD CONSTRAINT empleado_jornadalaboral_fk FOREIGN KEY(jornadalaboral_idjornadalaboral )
        REFERENCES jornadalaboral(idjornadalaboral);

ALTER TABLE empleado
    ADD CONSTRAINT empleado_puesto_fk FOREIGN KEY(puesto_idpuesto )
        REFERENCES puesto(idpuesto);

ALTER TABLE empleado_situacion
    ADD CONSTRAINT empleado_situacion_empleado_fk FOREIGN KEY(empleado_idempleado )
        REFERENCES empleado(idempleado);


ALTER TABLE empleado_situacion
    ADD CONSTRAINT empleado_situacion_situacion_fk FOREIGN KEY(situacion_idsituacion )
        REFERENCES situacion(idsituacion);

ALTER TABLE empleado_vuelo
    ADD CONSTRAINT empleado_vuelo_empleado_fk FOREIGN KEY(empleado_idempleado )
        REFERENCES empleado(idempleado);

ALTER TABLE empleado_vuelo
    ADD CONSTRAINT empleado_vuelo_vuelo_fk FOREIGN KEY(vuelo_idvuelo )
        REFERENCES vuelo(idvuelo);

CREATE TABLE factura_formadepago(
    formapago_idformapago  INTEGER NOT NULL,
    factura_idfactura      INTEGER NOT NULL
);

CREATE TABLE formapago(
    idformapago  INTEGER NOT NULL,
    nombre       VARCHAR2(255) NOT NULL,
    notarjeta    INTEGER
);

ALTER TABLE formapago ADD CONSTRAINT formapago_pk PRIMARY KEY(idformapago);

CREATE TABLE idioma(
    ididioma  INTEGER NOT NULL,
    nombre    VARCHAR2(255) NOT NULL
);

ALTER TABLE idioma ADD CONSTRAINT idioma_pk PRIMARY KEY(ididioma);
ALTER TABLE factura
    ADD CONSTRAINT factura_cliente_fk FOREIGN KEY(cliente_idcliente )
        REFERENCES cliente(idcliente);

ALTER TABLE factura_formadepago
    ADD CONSTRAINT factura_formadepago_factura_fk FOREIGN KEY(factura_idfactura )
        REFERENCES factura(idfactura);


ALTER TABLE factura_formadepago
    ADD CONSTRAINT factura_formadepago_formapago_fk FOREIGN KEY(formapago_idformapago )
        REFERENCES formapago(idformapago);
        
CREATE TABLE idioma_empleado(
    idioma_ididioma      INTEGER NOT NULL,
    empleado_idempleado  INTEGER NOT NULL
);

CREATE TABLE jornadalaboral(
    idjornadalaboral  INTEGER NOT NULL,
    nombre            VARCHAR2(255) NOT NULL
);

ALTER TABLE jornadalaboral ADD CONSTRAINT jornadalaboral_pk PRIMARY KEY(idjornadalaboral);

CREATE TABLE mantenimiento_empleado(
    matenimiento_idmantenimiento  INTEGER NOT NULL,
    empleado_idempleado           INTEGER NOT NULL
);

CREATE TABLE matenimiento(
    idmantenimiento                        INTEGER NOT NULL, 
 
         tipomantenimiento_idtipomantenimiento  INTEGER NOT NULL,
    fecha                                  DATE NOT NULL,
    observaciones                          VARCHAR2(255) NOT NULL,
    inconvenientes                         VARCHAR2(255) NOT NULL,
    avion_idavion                          INTEGER NOT NULL
);

ALTER TABLE matenimiento ADD CONSTRAINT matenimiento_pk PRIMARY KEY(idmantenimiento);
ALTER TABLE mantenimiento_empleado
    ADD CONSTRAINT mantenimiento_empleado_empleado_fk FOREIGN KEY(empleado_idempleado )
        REFERENCES empleado(idempleado);


ALTER TABLE mantenimiento_empleado
    ADD CONSTRAINT mantenimiento_empleado_matenimiento_fk FOREIGN KEY(matenimiento_idmantenimiento )
        REFERENCES matenimiento(idmantenimiento);

ALTER TABLE matenimiento
    ADD CONSTRAINT matenimiento_avion_fk FOREIGN KEY(avion_idavion )
        REFERENCES avion(idavion);


ALTER TABLE matenimiento
    ADD CONSTRAINT matenimiento_tipomantenimiento_fk FOREIGN KEY(tipomantenimiento_idtipomantenimiento )
        REFERENCES tipomantenimiento(idtipomantenimiento);
CREATE TABLE puesto(
    idpuesto  INTEGER NOT NULL,
    nombre    VARCHAR2(255) NOT NULL
);

ALTER TABLE puesto ADD CONSTRAINT puesto_pk PRIMARY KEY(idpuesto);

ALTER TABLE idioma_empleado
    ADD CONSTRAINT idioma_empleado_empleado_fk FOREIGN KEY(empleado_idempleado )
        REFERENCES empleado(idempleado);

ALTER TABLE idioma_empleado
    ADD CONSTRAINT idioma_empleado_idioma_fk FOREIGN KEY(idioma_ididioma )
        REFERENCES idioma(ididioma);
        
CREATE TABLE restriccion(
    idrestriccion  INTEGER NOT NULL,
    nombre         VARCHAR2(255) NOT NULL
);

ALTER TABLE restriccion ADD CONSTRAINT restriccion_pk PRIMARY KEY(idrestriccion);

CREATE TABLE situacion(
    idsituacion  INTEGER NOT NULL,
    nombre       VARCHAR2(255) NOT NULL
);

ALTER TABLE situacion ADD CONSTRAINT situacion_pk PRIMARY KEY(idsituacion);

CREATE TABLE tipomantenimiento(
    idtipomantenimiento  INTEGER NOT NULL,
    nombre               VARCHAR2(255) NOT NULL
);

ALTER TABLE tipomantenimiento ADD CONSTRAINT tipomantenimiento_pk PRIMARY KEY(idtipomantenimiento);

CREATE TABLE vuelo(
    idvuelo              INTEGER NOT NULL,
    nombre               VARCHAR2(255) NOT NULL,
    fechahoradespegue    DATE NOT NULL,
    fechahoraaterrizaje  DATE NOT NULL,
    avion_idavion        INTEGER NOT NULL
);

ALTER TABLE vuelo ADD CONSTRAINT vuelo_pk PRIMARY KEY(idvuelo);

CREATE TABLE vuelo_ciudad(
    vuelo_idvuelo    INTEGER NOT NULL,
    ciudad_idciudad  INTEGER NOT NULL
);

ALTER TABLE vuelo
    ADD CONSTRAINT vuelo_avion_fk FOREIGN KEY(avion_idavion )
        REFERENCES avion(idavion);

ALTER TABLE vuelo_ciudad
    ADD CONSTRAINT vuelo_ciudad_ciudad_fk FOREIGN KEY(ciudad_idciudad )
        REFERENCES ciudad(idciudad);

ALTER TABLE vuelo_ciudad
    ADD CONSTRAINT vuelo_ciudad_vuelo_fk FOREIGN KEY(vuelo_idvuelo )
        REFERENCES vuelo(idvuelo);



