**Caso #1**

**Payment assistant**

IC-4301 Bases de Datos I

Instituto Tecnológico de Costa Rica

Campus Tecnológico Central Cartago

Escuela de Ingeniería en Computación

II Semestre 2024

Prof. Msc. Rodrigo Núñez Núñez

Efraim Cuevas Aguilar

Carné: 2024109746

José Julián Monge Brenes

Carné: 2024247024

Fecha de entrega: Sábado 15 de marzo de 2024

# **Lista de entidades**

## **Usuarios y Roles**

**Usuarios:**

-   Nombre

-   Apellidos

-   Email

-   Contraseña (Hasheada)

-   Estado *(Activo/Inactivo)*

**Roles:**

-   Nombre del rol (*\"Administrador\"*, *\"Usuario Básico\"*)

-   Descripción (*\"Acceso completo al sistema\"*, *\"Puede ver reportes
    pero no modificarlos\"*)

-   Roles por usuario (Ejemplo: *Carlos tiene el rol de Administrador*)

**Permisos:**

-   Código (*\"EDIT_USER\"*, *\"DELETE_POST\"*)

-   Nombre del permiso (*\"Editar Usuarios\"*, *\"Eliminar
    Publicaciones\"*)

-   Descripción (*\"Permite modificar datos de usuarios\"*, *\"Permite
    eliminar posts en la plataforma\"*)

-   Permisos por usuario (Ejemplo: *Carlos tiene el permiso de
    \"EDIT_USER\"*)

-   Permisos por rol (*El rol \"Administrador\" tiene \"DELETE_POST\" y
    \"EDIT_USER\"*)

## **Contactos**

**Información de Contacto:** Esta entidad contaría como EVS, por la gran
variedad de contactos que puede una persona.

-   Valor (*\"+52 55 1234 5678\"*, *\"usuario@correo.com\"*)

-   Estado (*\"Activo\"*, *\"Desactivado\"*)

-   Fecha de última actualización (*\"2024-03-14 10:30:00\"*)

-   Tipo de contacto (*\"Correo electrónico\"*, *\"Telegram\"*,
    *\"Número de teléfono\"*)

## **Pagos y Finanzas**

**Métodos de Pago:** Procesadores de pago disponibles.

-   Conexión API (*\"https://api.paypal.com/v1/payments\"*)

-   Nombre (*\"PayPal\"*, *\"Stripe\"*)

-   Logo/Icono (URL) (*\"https://cdn.paypal.com/logo.png\"*)

-   Estado

**Métodos de Pago Disponibles:** Info relevante de tarjetas de
crédito/débito

-   Token (Token del procesador de pago para obtener los datos de la
    tarjeta de manera segura. Ejemplo: \"tok_1Hq5m2E2N3K4L5M6\")

-   Fecha de expiración (*\"12/2026\"*)

-   Masked Number (*\"*\*\*\* \*\*\*\* \*\*\*\* 1234\"\*)

-   

**Pagos:**

-   Monto (Ejemplo: \"250.00\", \"1000.50\")

-   Fecha de pago (Ejemplo: \"2025-03-14 15:00:00\")

-   Frecuencia (Ejemplo: \"Mensual\", \"Único\", \"Anual\")

-   Confirmado (Ejemplo: \"0\" = No confirmado, \"1\" = Confirmado)

-   Resultado (Ejemplo: \"Aprobado\", \"Rechazado\", \"Pendiente\")

-   Auth code (Ejemplo: \"A1B2C3D4\")

-   Número de referencia (Ejemplo: \"REF-987654321\")

-   Token para validar modificaciones (Ejemplo: \"tok_abcdef123456\")

-   Descripción (Ejemplo: \"Pago de suscripción mensual\")

-   Error (Ejemplo: \"Fondos insuficientes\", \"NULL\" si no hubo error)

-   Tipo de pago (Ejemplo: \"Tarjeta de crédito\", \"PayPal\",
    \"Transferencia bancaria\")

**Transacciones:**

-   Fecha (*\"2024-03-10 15:46:00\"*)

-   Estado *(Ejemplo: \"Procesando\", \"Completado\", \"Fallido\")*

-   Fecha de confirmación de la transacción (*\"2024-03-10 15:50:00\"*)

-   Número de Referencia (*\"TXN202403101234\"*)

-   Usuario que realizó la transacción (*\"Carlos Gómez\"*)

-   Tasa de conversión si hubo cambio de moneda (*\"1 USD = 18.50
    MXN\"*)

-   Monto Convertido (*\"\$923.45 MXN\"*)

-   Tipo de Transacción (*\"Pago\"*, *\"Reembolso\"*)

-   Subtipo de Transacción (*\"Suscripción\"*, *\"Compra única\"*)

## **Bitácoras**

**Tipos de Bitácoras:** Define los diferentes tipos de eventos
registrados en la bitácora.

-   Nombre *(Ejemplo: \"Error de Pago\", \"Inicio de Sesión\")*

-   Descripción de Referencia 1

-   Descripción de Referencia 2

-   Descripción de Valor 1

-   Descripción de Valor 2

**Severidad de Bitácora:** Define el nivel de importancia de los eventos
en la bitácora.

**Source de Bitácora:** Registra la fuente del evento en la bitácora.

**Bitácora:**

-   Descripción (*\"Intento de pago rechazado\"*)

-   Fecha y hora del evento (*\"2024-03-10 15:47:00\"*)

-   Dispositivo (*\"Chrome en Windows 10\"*)

-   Nombre de Usuario *(Usuario que realizó la acción, si aplica)*

-   Trace (*\"Error 402: Fondos insuficientes\"*)

-   Referencia 1 *(Campo de referencia de la llave) (\"Monto\")*

-   Referencia 2 *(Campo de referencia adicional)*

-   Valor 1 *(\"\$49.99\")*

-   Valor 2 *(\"\$0.00\")*

## **Internacionalización y Monedas**

**Monedas:**

-   Nombre (*\"Dólar estadounidense\"*, *\"Peso mexicano\"*)

-   Acrónimo (*\"USD\"*, *\"MXN\"*)

-   Símbolo (*\"\$\"*, *\"₱\"*)

**Tipos de Cambio:**

-   Origen (*\"USD\"*)

-   Destino (*\"MXN\"*)

-   Fecha de inicio (*\"2024-01-01\"*)

-   Fecha de fin (*\"2024-12-31\"*)

-   Tasa de cambio (*\"18.50\"*)

-   Estado (*\"Activo\"*)

-   Es tasa actual (*1 - Sí, 0 - No*)

**Lenguajes:**

-   Nombre (Ejemplo: \"Español\", \"Inglés\", \"Francés\")

-   Cultura (Ejemplo: \"es-MX\", \"en-US\", \"fr-FR\")

**Traducciones:**

-   Código (Ejemplo: \"BTN_SUBMIT\")

-   Caption (Ejemplo: \"Enviar\", \"Submit\")

-   Estado (Ejemplo: \"Activo\", \"Desactivado\")

**Módulos:** Serán para diferenciar los distintos módulos del sistema
(Servirá para las traducciones y los permisos en las distintas partes
del sistema)

## **Subscripciones y Planes**

**Plan Features:**

-   Descripción (*\"Exportar en HD\"*)

-   Estado (*\"Activo\"*)

-   DataType (*\"Booleano\"*)

**Subscripciones:**

-   Descripción (*\"Premium\"*, *\"Básico\"*)

**Features de la Subscripción:**

-   Valor (*\"10GB de almacenamiento\"*)

-   Estado (*\"Activo\"*)

**Precios de los Planes:**

-   Cantidad (*\"\$9.99\"* - Mensual)

-   PostTime (*\"2024-01-01\"*)

-   EndDate (*\"2024-12-31\"*)

-   Actual (*1 - Sí, 0 - No*)

**Planes de Precios de Usuarios:**

-   ID Usuario (FK, usuarios)

-   ID Plan Price (FK, plan_prices)

-   ID Schedule (FK, schedules)

-   Adquisition Date

-   Estado

**Schedules:**

-   Nombre (Ejemplo: \"Plan Mensual\", \"Plan Anual\")

-   Si se repite (Ejemplo: \"1\" = Sí, \"0\" = No)

-   Repeticiones (Ejemplo: \"12\" = Mensual por 12 meses)

-   EndDate (Ejemplo: \"2025-12-31\")

**Schedule Details:** Detalles sobre la recurrencia (Si es mensual,
diaria, semanal)

-   Deleted (Ejemplo: \"0\" = Activo, \"1\" = Eliminado)

-   DatePart (Ejemplo: \"Día\", \"Semana\", \"Mes\")

-   Last Execute (Ejemplo: \"2025-03-01 10:00:00\")

-   Next Execute (Ejemplo: \"2025-04-01 10:00:00\")

## **APIs y Comunicaciones**

**Integraciones API:**

-   Nombre (*\"Stripe API\"*)

-   Nombre del proveedor (*\"Stripe\"*)

-   Public Key (*\"pk_test_123456\"*)

-   Secret Key (*\"sk_test_654321\"*)

-   URL (*\"<https://api.stripe.com>\"*)

-   Estado (*\"Activo\"*)

-   Fecha de creación (*\"2024-01-15\"*)

**Archivos multimedia:**

-   URL (*\"https://cdn.dominio.com/imagen1.jpg\"*)

-   Borrado (*0 - No borrado, 1 - Borrado*)

-   Tipo de archivo (*\"Imagen\"*, *\"Video\"*)

-   Fecha de carga (*\"2024-02-10\"*)

-   Usuario asociado (*\"Carlos Gómez\"*)

## **Detalles adicionales de diseño**

-   No se tuvo en cuenta los Balances, debido a que la base de datos
    está destinada a un asistente de pagos, por lo que la plata va a ir
    en una sola dirección.

-   No hay entidades de empresas, ya que el asistente de pagos es para
    pagos personales

## **Diseño del sistema de subscripciones**

![A screenshot of a computer AI-generated content may be
incorrect.](imagenes/media/image1.png){width="5.761220472440945in"
height="2.958746719160105in"}

Cada subscripción que se ingrese en el sistema se define en la tabla de
[subscriptions]{.underline}, donde se almacena una descripción del plan,
como por ejemplo "Free" o "Premium". Dentro de cada plan puede haber
múltiples características, y estas se registran en
[plan_features]{.underline}, así cada característica del plan se guarda
con una descripción, el tipo de dato que es, y si está activa.

Por ejemplo:

ID: 1, Descripción: \"Exportar en HD\", Estado: Activo, DataType:
Booleano

ID: 2, Descripción: \"Proyectos simultáneos\", Estado: Activo, DataType:
Entero

Las características se vinculan a través de la tabla
[plan_features_subscriptions]{.underline}, donde se relacionan con una
suscripción específica y se le puede asignar un valor. Por ejemplo, en
la imagen, el plan "Básico" otorga 10Gb de espacio en el disco y 100Gb
en la subscripción "Profesional".

![Predyctics - Software \| Business
Intelligence](imagenes/media/image2.jpeg){width="3.808695319335083in"
height="2.286033464566929in"}

[plan_prices]{.underline} es la tabla que maneja los precios de las
subscripciones, el tipo de moneda, la fecha de inicio y finalización de
cada tarifa. El atributo booleano indica si es un precio vigente en el
momento. De esta manera se pueden cambiar los costos sin afectar los
registros anteriores, y los usuarios que, por ejemplo, hayan conseguido
un plan en promoción mantengan ese precio hasta que renueven la
subscripción.

Cuando un usuario se suscribe a un plan, se almacena un registro en
[users_plan_prices]{.underline}, que asocia al usuario con el precio del
plan que eligió. También se guarda la fecha de adquisición y el estado
de la suscripción (activa o cancelada). Además, este registro está
vinculado con la tabla [schedules]{.underline}, lo que permite definir
la recurrencia de la subscripción.

## **Métodos de pago y APIs**

![A screen shot of a computer AI-generated content may be
incorrect.](imagenes/media/image3.png){width="6.5in"
height="2.077777777777778in"}

La tabla [api_integrations]{.underline} es la que almacena información
sobre los servicios externos del sistema, en este caso los procesadores
de pago como Paypal, Stripe o MercadoPago. Se guardan ya sea las llaves
privadas o públicas para integrarse a la URL. El enabled indica si el
API está activa y las fechas son para rastrear cualquier cambio en su
configuración.

[pay_pay_methods]{.underline} tiene un identificador asociado del API de
los procesadores de pago que tendrá en la base de datos, un nombre, un
ícono del método y un estado para indicar si está activo.

[pay_available_payment_methods]{.underline} almacena los métodos de pago
que cada usuario ha registrado en el sistema. Cada registro está
vinculado a un usuario (user_id). Se almacena el nombre del método de
pago (name), un token que representa la información de pago de forma
segura (por ejemplo, un token de tarjeta almacenado por un proveedor de
pagos), y la fecha de expiración del token (expToken). También se guarda
un campo mask_account para mostrar parcialmente la cuenta asociada, como
los últimos cuatro dígitos de una tarjeta de crédito. Finalmente,
method_id referencia el tipo de método de pago registrado, vinculándolo
con la tabla [pay_pay_methods]{.underline}.

## **Pagos** 

![A screenshot of a computer AI-generated content may be
incorrect.](imagenes/media/image4.png){width="2.0419520997375327in"
height="3.9901399825021873in"}

Cada pago procesado por el sistema se almacena en la tabla. Siempre se
van a almacenar datos como el monto, la fecha del pago, la moneda
utilizada, método de pago y la confirmación.

Por ejemplo:

ID: 1, Tipo: \"Pago único\", Monto: 10.00, Moneda: USD (Asociado del
currency id), Fecha: 2025-03-14, Confirmado: Sí, Método de pago: Tarjeta
de crédito\
ID: 2, Tipo: \"Suscripción mensual\", Monto: 25.99, Moneda: EUR
(Asociado del currency id), Fecha: 2025-03-01, Confirmado: Sí, Método de
pago: PayPal

Pueden ocurrir errores, así que hay un espacio para insertar los errores
para saber como manejarlo. También debe tener referencias de
autenticación (auth, reference) y tokens de seguridad (change_token).

## **Transacciones**

![A screenshot of a computer program AI-generated content may be
incorrect.](imagenes/media/image5.png){width="3.8963768591426073in"
height="4.708990594925634in"}

Cada pago siempre se va a referenciar a una transacción, la cual maneja
su propia fecha y estado, ya que puede que un pago no esté confirmado,
entonces no puede estar completado. Por ejemplo si un usuario paga su
suscripción mensual en dólares, pero el sistema convierte la moneda:

ID: 101, Pago: 2, Fecha: 2025-03-01, Estado: Completado, Referencia:
\"ABC123\", Usuario: 10, Tasa de cambio: 1.10, Monto convertido: 28.59
EUR

Se registra también un número de referencia, el usuario de la
transacción y la conversión de moneda si es necesaria. Lo último se hace
por un asunto de conveniencia.

Por ejemplo si ocurre un intento fallido de pago con tarjeta:

ID: 102, Pago: 1, Fecha: 2025-03-14, Estado: Fallido, Referencia:
\"XYZ456\", Usuario: 12, Error: \"Fondos insuficientes\"

Cada transacción tiene un tipo y subtipo, lo que permite clasificar las
operaciones según su naturaleza (ej. \"Pago\" o \"Reembolso\").
