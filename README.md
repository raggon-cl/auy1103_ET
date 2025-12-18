# Evaluación Final Transversal: Infraestructura como Código I (AUY1103)

[cite_start]Este repositorio contiene el código base en **Terraform** para el despliegue de una arquitectura web multinivel en **Amazon Web Services (AWS)**[cite: 16, 20]. [cite_start]La evaluación consiste en la ejecución, diagnóstico y mejora de este script para cumplir con los estándares de disponibilidad y eficiencia operativa[cite: 20].

## 1. Descripción de la Infraestructura

El proyecto tiene como objetivo desplegar una infraestructura básica que soporte una aplicación web escalable, compuesta por los siguientes componentes:

### Redes y Seguridad
* **VPC y Conectividad:** Se define una subred pública, un Internet Gateway y las tablas de enrutamiento necesarias para permitir el tráfico hacia el exterior.
* **Seguridad:** Un **Security Group** actúa como firewall virtual para controlar el tráfico entrante (Ingress) y saliente (Egress) de las instancias de cómputo.

### Capa de Cómputo
* **Servidores de Aplicación:** Se despliegan cuatro instancias **EC2** basadas en **Amazon Linux 2**.
* **Aprovisionamiento:** Las instancias iniciales incluyen un bloque de automatización (`remote-exec`) para la instalación y configuración automática del servidor web **Apache (httpd)**.

### Capa de Datos
* **Base de Datos Relacional:** Se incluye la configuración de un clúster **Amazon Aurora (MySQL)** para la persistencia de datos.
* **Gestión de Red de Datos:** Se utiliza un **DB Subnet Group** para organizar la ubicación de la base de datos dentro de la red privada.

---

## 2. Instrucciones para el Estudiante

[cite_start]De acuerdo con la pauta de evaluación[cite: 20]:

### Ítem I: Ejecución y Diagnóstico
1.  [cite_start]**Configuración del Entorno:** Configure sus credenciales de AWS mediante variables de entorno o AWS CLI[cite: 20].
2.  [cite_start]**Inicialización:** Ejecute `terraform init` para descargar los providers necesarios[cite: 20].
3.  [cite_start]**Despliegue:** Ejecute `terraform plan` y `terraform apply`[cite: 20].
    * [cite_start]**Nota Crítica:** Es responsabilidad del estudiante diagnosticar y corregir cualquier error (sintáctico, de recursos o de conectividad) que impida el despliegue exitoso[cite: 20]. [cite_start]Se evaluará la capacidad de **troubleshooting** y el uso de técnicas de **debugging**[cite: 20].

### Ítem II: Optimización y Mejora
[cite_start]Una vez que el script sea funcional, deberá implementar mejoras técnicas que incluyan[cite: 20]:
* [cite_start]**Modularización:** Refactorización de componentes repetitivos[cite: 20].
* [cite_start]**Parametrización:** Uso de variables para flexibilizar el código[cite: 20].
* [cite_start]**Funciones Internas:** Aplicación de funciones (`count`, `for_each`, etc.) para simplificar la lógica de creación de recursos[cite: 20].

---

## 3. Requisitos Técnicos
* **Terraform:** v1.0.0 o superior.
* **Proveedor Cloud:** AWS (Credenciales configuradas con permisos suficientes para EC2, VPC y RDS).
* **Región por defecto:** `us-east-1`.

---

### Entrega
[cite_start]Siga las instrucciones de su instructor para la entrega del código refactorizado y el archivo de estado (`terraform.tfstate`) según los indicadores de logro definidos en la pauta[cite: 20, 23].
