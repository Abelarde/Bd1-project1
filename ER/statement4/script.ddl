

CREATE TABLE banco (
    idbanco  INTEGER NOT NULL,
    nombre   VARCHAR2(255 CHAR) NOT NULL
);

ALTER TABLE banco ADD CONSTRAINT banco_pk PRIMARY KEY ( idbanco );

CREATE TABLE cliente (
    idcliente       INTEGER NOT NULL,
    nombrecompleto  VARCHAR2(255 CHAR) NOT NULL,
    direccion       VARCHAR2(255 CHAR),
    telefono        INTEGER NOT NULL,
    telefonocasa    INTEGER,
    correo          VARCHAR2(255 CHAR) NOT NULL,
    dpi             INTEGER NOT NULL,
    nit             INTEGER NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( idcliente );

CREATE TABLE color (
    idcolor  INTEGER NOT NULL,
    nombre   VARCHAR2(255 CHAR) NOT NULL
);

ALTER TABLE color ADD CONSTRAINT color_pk PRIMARY KEY ( idcolor );
ALTER TABLE sucursal_empleado
    ADD CONSTRAINT sucursal_empleado_sucursal_fk FOREIGN KEY ( sucursal_idsucursal )
        REFERENCES sucursal ( idsucursal );

ALTER TABLE sucursal
    ADD CONSTRAINT sucursal_municipio_fk FOREIGN KEY ( municipio_idmunicipio )
        REFERENCES municipio ( idmunicipio );

ALTER TABLE tarjetacredito
    ADD CONSTRAINT tarjetacredito_banco_fk FOREIGN KEY ( banco_idbanco )
        REFERENCES banco ( idbanco );

CREATE TABLE compra (
    idcompra                               INTEGER NOT NULL,
    proveedor_idproveedor                  INTEGER NOT NULL,
    montodescuento                         NUMBER(10, 2),
    razondescuento                         VARCHAR2(255 CHAR), 
         sucursal_empleado_empleado_idempleado  INTEGER NOT NULL, 
         sucursal_empleado_sucursal_idsucursal  INTEGER
    NOT NULL,
    idsucursal1                            INTEGER NOT NULL,
    idempleado1                            INTEGER NOT NULL,
    sucursal_empleado_fecha                DATE NOT NULL,
    fechahora                              DATE NOT NULL,
    total                                  NUMBER(10, 2) NOT NULL,
    cre1cont0                              CHAR(1 CHAR) NOT NULL
);

ALTER TABLE compra ADD CONSTRAINT compra_pk PRIMARY KEY ( idcompra );

CREATE TABLE condicion (
    idcondicion  INTEGER NOT NULL,
    nombre       VARCHAR2(255 CHAR) NOT NULL
);

ALTER TABLE condicion ADD CONSTRAINT condicion_pk PRIMARY KEY ( idcondicion );

CREATE TABLE departamento (
    iddepartamento  INTEGER NOT NULL,
    nombre          VARCHAR2(255 CHAR) NOT NULL
);

ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY ( iddepartamento );

CREATE TABLE empleado (
    idempleado  INTEGER NOT NULL,
    nombre      VARCHAR2(255 CHAR) NOT NULL,
    dpi         INTEGER NOT NULL,
    nit         INTEGER,
    telefono    INTEGER,
    sueldo      NUMBER(10, 2)
);

ALTER TABLE empleado ADD CONSTRAINT empleado_pk PRIMARY KEY ( idempleado );

CREATE TABLE marca (
    idmarca  INTEGER NOT NULL,
    nombre   VARCHAR2(255 CHAR) NOT NULL
);

ALTER TABLE marca ADD CONSTRAINT marca_pk PRIMARY KEY ( idmarca );

CREATE TABLE municipio (
    idmunicipio                  INTEGER NOT NULL,
    nombre                       VARCHAR2(255 CHAR) NOT NULL,
    departamento_iddepartamento  INTEGER NOT NULL
);

ALTER TABLE municipio ADD CONSTRAINT municipio_pk PRIMARY KEY ( idmunicipio );

CREATE TABLE proveedor (
    idproveedor        INTEGER NOT NULL,
    nombre             VARCHAR2(255 CHAR) NOT NULL,
    direccion          VARCHAR2(255 CHAR),
    telefono           INTEGER,
    correoelectronico  VARCHAR2(255 CHAR),
    empresa            VARCHAR2(255 CHAR)
);

ALTER TABLE proveedor ADD CONSTRAINT proveedor_pk PRIMARY KEY ( idproveedor );

CREATE TABLE sucursal (
    idsucursal             INTEGER NOT NULL,
    nombre                 VARCHAR2(255 CHAR) NOT NULL,
    direccion              VARCHAR2(255 CHAR),
    telefono               INTEGER,
    sitioweb               VARCHAR2(255 CHAR),
    municipio_idmunicipio  INTEGER NOT NULL
);

ALTER TABLE sucursal ADD CONSTRAINT sucursal_pk PRIMARY KEY ( idsucursal );
ALTER TABLE compra
    ADD CONSTRAINT compra_proveedor_fk FOREIGN KEY ( proveedor_idproveedor )
        REFERENCES proveedor ( idproveedor );

ALTER TABLE compra
    ADD CONSTRAINT compra_sucursal_empleado_fk FOREIGN KEY ( sucursal_empleado_empleado_idempleado,
                                                             sucursal_empleado_sucursal_idsucursal,
                                                             sucursal_empleado_fecha )
        REFERENCES sucursal_empleado ( empleado_idempleado,
                                       sucursal_idsucursal,
                                       fecha );

ALTER TABLE municipio
    ADD CONSTRAINT municipio_departamento_fk FOREIGN KEY ( departamento_iddepartamento )
        REFERENCES departamento ( iddepartamento );

ALTER TABLE sucursal_empleado
    ADD CONSTRAINT sucursal_empleado_empleado_fk FOREIGN KEY ( empleado_idempleado )
        REFERENCES empleado ( idempleado );

CREATE TABLE sucursal_empleado (
    sucursal_idsucursal  INTEGER NOT NULL,
    empleado_idempleado  INTEGER NOT NULL,
    fecha                DATE NOT NULL
);

ALTER TABLE sucursal_empleado
    ADD CONSTRAINT sucursal_empleado_pk PRIMARY KEY ( empleado_idempleado,
                                                      sucursal_idsucursal,
                                                      fecha );

CREATE TABLE tarjetacredito (
    idtarjetacredito     INTEGER NOT NULL,
    numero               INTEGER NOT NULL,
    cliente_idcliente    INTEGER NOT NULL,
    banco_idbanco        INTEGER NOT NULL,
    empleado_idempleado  INTEGER NOT NULL
);

ALTER TABLE tarjetacredito ADD CONSTRAINT tarjetacredito_pk PRIMARY KEY ( idtarjetacredito );

ALTER TABLE tarjetacredito
    ADD CONSTRAINT tarjetacredito_cliente_fk FOREIGN KEY ( cliente_idcliente )
        REFERENCES cliente ( idcliente );

ALTER TABLE tarjetacredito
    ADD CONSTRAINT tarjetacredito_empleado_fk FOREIGN KEY ( empleado_idempleado )
        REFERENCES empleado ( idempleado );

ALTER TABLE vehiculo_color
    ADD CONSTRAINT vehiculo_color_color_fk FOREIGN KEY ( color_idcolor )
        REFERENCES color ( idcolor );

ALTER TABLE vehiculo_color
    ADD CONSTRAINT vehiculo_color_vehiculo_fk FOREIGN KEY ( vehiculo_idvehiculo )
        REFERENCES vehiculo ( idvehiculo );


CREATE TABLE transmision (
    idtransmision  INTEGER NOT NULL,
    nombre         INTEGER NOT NULL
);

ALTER TABLE transmision ADD CONSTRAINT transmision_pk PRIMARY KEY ( idtransmision );

CREATE TABLE vehiculo (
    idvehiculo                 INTEGER NOT NULL,
    placa                      INTEGER,
    modelo                     INTEGER NOT NULL,
    kilometraje                NUMBER(10, 2) NOT NULL,
    ano                        INTEGER NOT NULL,
    nopuertas                  INTEGER NOT NULL,
    marca_idmarca              INTEGER NOT NULL,
    transmision_idtransmision  INTEGER NOT NULL,
    condicion_idcondicion      INTEGER NOT NULL,
    compra_idcompra            INTEGER NOT NULL,
    precio                     INTEGER NOT NULL,
    sucursal_idsucursal        INTEGER NOT NULL,
    venta_idventa              INTEGER NOT NULL
);

ALTER TABLE vehiculo ADD CONSTRAINT vehiculo_pk PRIMARY KEY ( idvehiculo );

ALTER TABLE vehiculo
    ADD CONSTRAINT vehiculo_compra_fk FOREIGN KEY ( compra_idcompra )
        REFERENCES compra ( idcompra );

ALTER TABLE vehiculo
    ADD CONSTRAINT vehiculo_condicion_fk FOREIGN KEY ( condicion_idcondicion )
        REFERENCES condicion ( idcondicion );

ALTER TABLE vehiculo
    ADD CONSTRAINT vehiculo_marca_fk FOREIGN KEY ( marca_idmarca )
        REFERENCES marca ( idmarca );

ALTER TABLE vehiculo
    ADD CONSTRAINT vehiculo_sucursal_fk FOREIGN KEY ( sucursal_idsucursal )
        REFERENCES sucursal ( idsucursal );

ALTER TABLE vehiculo
    ADD CONSTRAINT vehiculo_transmision_fk FOREIGN KEY ( transmision_idtransmision )
        REFERENCES transmision ( idtransmision );

ALTER TABLE vehiculo
    ADD CONSTRAINT vehiculo_venta_fk FOREIGN KEY ( venta_idventa )
        REFERENCES venta ( idventa );


CREATE TABLE vehiculo_color (
    color_idcolor        INTEGER NOT NULL,
    vehiculo_idvehiculo  INTEGER NOT NULL
);

CREATE TABLE venta (
    idventa                                INTEGER NOT NULL,
    cliente_idcliente                      INTEGER NOT NULL,
    montodescuento                         NUMBER(10, 2),
    razondescuento                         VARCHAR2(255 CHAR),
    fechahora                              DATE NOT NULL,
    idsucursal1                            INTEGER NOT NULL,
    idempleado1                            INTEGER NOT NULL,
    idsucursal2                            INTEGER NOT NULL,
    idempleado2                            INTEGER NOT NULL, 
         sucursal_empleado_empleado_idempleado  INTEGER NOT NULL, 
         sucursal_empleado_sucursal_idsucursal  INTEGER
    NOT NULL,
    idsucursal3                            INTEGER NOT NULL,
    idempleado3                            INTEGER NOT NULL,
    sucursal_empleado_fecha                DATE NOT NULL,
    total                                  NUMBER(10, 2) NOT NULL,
    cre1cont0                              CHAR(1 CHAR) NOT NULL
);

ALTER TABLE venta ADD CONSTRAINT venta_pk PRIMARY KEY ( idventa );

ALTER TABLE venta
    ADD CONSTRAINT venta_cliente_fk FOREIGN KEY ( cliente_idcliente )
        REFERENCES cliente ( idcliente );

ALTER TABLE venta
    ADD CONSTRAINT venta_sucursal_empleado_fk FOREIGN KEY ( sucursal_empleado_empleado_idempleado,
                                                            sucursal_empleado_sucursal_idsucursal,
                                                            sucursal_empleado_fecha )
        REFERENCES sucursal_empleado ( empleado_idempleado,
                                       sucursal_idsucursal,
                                       fecha );
