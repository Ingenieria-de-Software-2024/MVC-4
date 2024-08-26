CREATE TABLE PRODUCTOS(
    PRODUCTO_ID SERIAL NOT NULL,
    PRODUCTO_NOMBRE VARCHAR(200),
    PRODUCTO_PRECIO DECIMAL(10, 2),
    PRODUCTO_SITUACION SMALLINT DEFAULT 1,
    PRIMARY KEY (PRODUCTO_ID)
);

CREATE TABLE CLIENTES (
    CLIENTE_ID SERIAL NOT NULL,
    CLIENTE_NOMBRE VARCHAR (50),
    CLIENTE_SITUACION SMALLINT DEFAULT 1,
    PRIMARY KEY (CLIENTE_ID)
);

CREATE TABLE VENTAS (
    VENTA_ID SERIAL NOT NULL,
    VENTA_FECHA DATETIME YEAR TO MINUTE,
    VENTA_SITUACION SMALLINT DEFAULT 1,
    PRIMARY KEY (VENTA_ID)
);

CREATE TABLE DETALLE_VENTAS (
    DETALLE_ID SERIAL NOT NULL,
    DETALLE_VENTA INTEGER,
    DETALLE_CLIENTE INTEGER,
    DETALLE_PRODUCTO INTEGER,
    DETALLE_CANTIDAD INTEGER,
    DETALLE_SITUACION SMALLINT DEFAULT 1,
    PRIMARY KEY (DETALLE_ID),
    FOREIGN KEY (DETALLE_VENTA) REFERENCES VENTAS (VENTA_ID),
    FOREIGN KEY (DETALLE_PRODUCTO) REFERENCES PRODUCTOS (PRODUCTO_ID),
    FOREIGN KEY (DETALLE_CLIENTE) REFERENCES CLIENTES (CLIENTE_ID)
);

INSERT INTO PRODUCTOS (PRODUCTO_NOMBRE, PRODUCTO_PRECIO) VALUES ('Café Americano', 2.50);
INSERT INTO PRODUCTOS (PRODUCTO_NOMBRE, PRODUCTO_PRECIO) VALUES ('Café Latte', 3.75);
INSERT INTO PRODUCTOS (PRODUCTO_NOMBRE, PRODUCTO_PRECIO) VALUES ('Croissant', 1.50);
INSERT INTO PRODUCTOS (PRODUCTO_NOMBRE, PRODUCTO_PRECIO) VALUES ('Tarta de Manzana', 2.25);
INSERT INTO PRODUCTOS (PRODUCTO_NOMBRE, PRODUCTO_PRECIO) VALUES ('Café Expreso', 2.00);

INSERT INTO CLIENTES (CLIENTE_NOMBRE) VALUES ('Luis Martínez');
INSERT INTO CLIENTES (CLIENTE_NOMBRE) VALUES ('Juan Pérez');
INSERT INTO CLIENTES (CLIENTE_NOMBRE) VALUES ('Ana Gómez');
INSERT INTO CLIENTES (CLIENTE_NOMBRE) VALUES ('Carlos López');
INSERT INTO CLIENTES (CLIENTE_NOMBRE) VALUES ('Marta Fernández');

INSERT INTO VENTAS (VENTA_FECHA) VALUES (CURRENT);
INSERT INTO VENTAS (VENTA_FECHA) VALUES (CURRENT);
INSERT INTO VENTAS (VENTA_FECHA) VALUES (CURRENT);
INSERT INTO VENTAS (VENTA_FECHA) VALUES (CURRENT);
INSERT INTO VENTAS (VENTA_FECHA) VALUES (CURRENT);

INSERT INTO DETALLE_VENTAS (DETALLE_VENTA, DETALLE_CLIENTE, DETALLE_PRODUCTO, DETALLE_CANTIDAD) VALUES (1, 5, 1, 2);
INSERT INTO DETALLE_VENTAS (DETALLE_VENTA, DETALLE_CLIENTE, DETALLE_PRODUCTO, DETALLE_CANTIDAD) VALUES (1, 4, 3, 1);
INSERT INTO DETALLE_VENTAS (DETALLE_VENTA, DETALLE_CLIENTE, DETALLE_PRODUCTO, DETALLE_CANTIDAD) VALUES (2, 3, 2, 1);
INSERT INTO DETALLE_VENTAS (DETALLE_VENTA, DETALLE_CLIENTE, DETALLE_PRODUCTO, DETALLE_CANTIDAD) VALUES (3, 2, 4, 2);
INSERT INTO DETALLE_VENTAS (DETALLE_VENTA, DETALLE_CLIENTE, DETALLE_PRODUCTO, DETALLE_CANTIDAD) VALUES (4, 1, 5, 3);

SELECT CLIENTE_NOMBRE AS CLIENTE, SUM (DETALLE_CANTIDAD) AS CANTIDAD_PRODUCTOS
FROM DETALLE_VENTAS
INNER JOIN CLIENTES ON DETALLE_CLIENTE = CLIENTE_ID
WHERE DETALLE_SITUACION = 1 
GROUP BY CLIENTE_NOMBRE

