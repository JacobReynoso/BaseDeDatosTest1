# BaseDeDatosTest1
# 📚 Sistema de Gestión de Biblioteca

## 🧩 Descripción general

Este proyecto implementa una **base de datos relacional** diseñada para la gestión integral de una biblioteca, tanto física como digital.  
Permite administrar **libros, categorías, editoriales, usuarios, préstamos, reservas y versiones digitales** de cada obra.

El modelo busca optimizar el control de:
- Disponibilidad y localización de copias físicas.
- Acceso a versiones digitales.
- Historial de préstamos y reservas.
- Información detallada de usuarios y editoriales.

---

## 🗃️ Estructura de la base de datos

### **1. categoria**
Contiene la información de las categorías o géneros literarios.

| Campo | Tipo | Descripción |
|--------|------|-------------|
| `id_categoria` | SERIAL (PK) | Identificador único de la categoría |
| `nombre_categoria` | VARCHAR(50) | Nombre de la categoría |
| `pais_categoria` | VARCHAR(50) | País asociado (opcional) |

---

### **2. editorial**
Guarda información de las editoriales que publican los libros.

| Campo | Tipo | Descripción |
|--------|------|-------------|
| `id_editorial` | SERIAL (PK) | Identificador único de la editorial |
| `nombre_editorial` | VARCHAR(50) | Nombre de la editorial |
| `pais_editorial` | VARCHAR(50) | País de origen de la editorial |

---

### **3. libro**
Registra la información principal de cada libro, tanto físico como digital.

| Campo | Tipo | Descripción |
|--------|------|-------------|
| `id_libro` | SERIAL (PK) | Identificador único del libro |
| `titulo_libro` | VARCHAR(100) | Título del libro |
| `autor_libro` | VARCHAR(100) | Autor o autores |
| `anio_publicacion_libro` | INTEGER | Año de publicación |
| `isbn_libro` | VARCHAR(13) | Código ISBN del libro |
| `id_categoria` | BIGINT (FK) | Relación con la tabla `categoria` |
| `id_editorial` | BIGINT (FK) | Relación con la tabla `editorial` |

📎 **Relaciones:**  
Un libro pertenece a una **categoría** y una **editorial**.  
Puede tener varias **copias físicas** y **versiones digitales**.

---

### **4. version_digital**
Contiene los datos asociados a las versiones digitales de los libros.

| Campo | Tipo | Descripción |
|--------|------|-------------|
| `id_digital` | SERIAL (PK) | Identificador único de la versión digital |
| `url_digital` | VARCHAR(150) | Enlace o ruta de acceso al archivo digital |
| `formato_digital` | VARCHAR(10) | Formato del archivo (PDF, EPUB, MOBI, etc.) |
| `tamano_digital_bytes` | BIGINT | Tamaño del archivo en bytes |
| `id_libro` | BIGINT (FK) | Referencia al libro correspondiente |

---

### **5. copia_fisica**
Administra las copias físicas disponibles en la biblioteca.

| Campo | Tipo | Descripción |
|--------|------|-------------|
| `id_copia_fisica` | SERIAL (PK) | Identificador de la copia física |
| `estado_copia_fisica` | VARCHAR(50) | Estado (disponible, dañada, prestada, etc.) |
| `ubicacion_copia_fisica` | VARCHAR(50) | Ubicación dentro de la biblioteca |
| `id_libro` | BIGINT (FK) | Referencia al libro original |

---

### **6. usuario**
Registra los datos de los usuarios del sistema.

| Campo | Tipo | Descripción |
|--------|------|-------------|
| `id_usuario` | SERIAL (PK) | Identificador único del usuario |
| `nombre_usuario` | VARCHAR(50) | Nombre del usuario |
| `tipo_usuario` | VARCHAR(50) | Tipo de usuario (alumno, profesor, visitante, etc.) |
| `correo_usuario` | VARCHAR(50) | Correo electrónico del usuario |

---

### **7. prestamo**
Lleva el control de los préstamos realizados por los usuarios.

| Campo | Tipo | Descripción |
|--------|------|-------------|
| `id_prestamo` | SERIAL (PK) | Identificador único del préstamo |
| `fecha_inicio_prestamo` | DATE | Fecha en que inicia el préstamo |
| `fecha_devolucion_prestamo` | DATE | Fecha en que se devuelve o debe devolverse |
| `estado_prestamo` | VARCHAR(20) | Estado del préstamo (activo, vencido, devuelto) |
| `id_usuario` | BIGINT (FK) | Usuario que realiza el préstamo |
| `id_libro` | BIGINT (FK) | Libro solicitado |
| `id_copia_fisica` | BIGINT (FK) | Copia física prestada |

---

### **8. reserva**
Administra las reservas de libros por parte de los usuarios.

| Campo | Tipo | Descripción |
|--------|------|-------------|
| `id_reserva` | SERIAL (PK) | Identificador único de la reserva |
| `fecha_reserva` | DATE | Fecha en que se realiza la reserva |
| `estado_reserva` | VARCHAR(60) | Estado (pendiente, completada, cancelada) |
| `id_usuario` | BIGINT (FK) | Usuario que realiza la reserva |
| `id_libro` | BIGINT (FK) | Libro reservado |

---

## 🔗 Relaciones principales

| Relación | Descripción |
|-----------|--------------|
| `libro` ↔ `categoria` | Un libro pertenece a una categoría. |
| `libro` ↔ `editorial` | Un libro pertenece a una editorial. |
| `libro` ↔ `version_digital` | Un libro puede tener una o varias versiones digitales. |
| `libro` ↔ `copia_fisica` | Un libro puede tener varias copias físicas. |
| `usuario` ↔ `prestamo` | Un usuario puede tener varios préstamos. |
| `usuario` ↔ `reserva` | Un usuario puede realizar varias reservas. |
| `copia_fisica` ↔ `prestamo` | Cada préstamo se asocia a una copia física específica. |

---

## ⚙️ Posibles consultas SQL útiles

```sql
-- Obtener todos los libros junto con su categoría y editorial
SELECT l.titulo_libro, c.nombre_categoria, e.nombre_editorial
FROM libro l
JOIN categoria c ON l.id_categoria = c.id_categoria
JOIN editorial e ON l.id_editorial = e.id_editorial;

-- Consultar préstamos activos de un usuario específico
SELECT p.id_prestamo, l.titulo_libro, p.fecha_inicio_prestamo, p.estado_prestamo
FROM prestamo p
JOIN libro l ON p.id_libro = l.id_libro
WHERE p.id_usuario = 1 AND p.estado_prestamo = 'activo';

-- Listar libros digitales disponibles
SELECT l.titulo_libro, v.url_digital, v.formato_digital
FROM version_digital v
JOIN libro l ON v.id_libro = l.id_libro;
