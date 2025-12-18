# Evaluación Final Transversal: Infraestructura como Código I (AUY1103)

Este repositorio contiene el código base en **Terraform** para el despliegue de una arquitectura web multinivel en **Amazon Web Services (AWS)**. La evaluación consiste en la ejecución, diagnóstico y mejora de este script para cumplir con los estándares de disponibilidad y eficiencia operativa.

## 1. Descripción de la Infraestructura

El proyecto tiene como objetivo desplegar una infraestructura básica que soporte una aplicación web escalable, compuesta por los siguientes componentes:

(Descripción debe ser entregada por cada alumno, al docente)

---

## 2. Instrucciones para el Estudiante

De acuerdo con la pauta de evaluación:

### Ítem I: Ejecución y Diagnóstico
1.  **Configuración del Entorno:** Configure sus credenciales de AWS mediante variables de entorno o AWS CLI.
2.  **Inicialización:** Ejecute `terraform init` para descargar los providers necesarios.
3.  **Despliegue:** Ejecute `terraform plan` y `terraform apply`.
    * **Nota Crítica:** Es responsabilidad del estudiante diagnosticar y corregir cualquier error (sintáctico, de recursos o de conectividad) que impida el despliegue exitoso. Se evaluará la capacidad de **troubleshooting** y el uso de técnicas de **debugging**.

### Ítem II: Optimización y Mejora
Una vez que el script sea funcional, deberá implementar mejoras técnicas que incluyan:
* **Modularización:** Refactorización de componentes repetitivos.
* **Parametrización:** Uso de variables para flexibilizar el código.
* **Funciones Internas:** Aplicación de funciones (`count`, `for_each`, etc.) para simplificar la lógica de creación de recursos.

---

## 3. Requisitos Técnicos
* **Terraform:** v1.0.0 o superior.
* **Proveedor Cloud:** AWS (Credenciales configuradas con permisos suficientes para EC2, VPC y RDS).
* **Región por defecto:** `us-east-1`.

---

### Entrega
Siga las instrucciones de su instructor para la entrega del código refactorizado y el archivo de estado (`terraform.tfstate`) según los indicadores de logro definidos en la pauta.
