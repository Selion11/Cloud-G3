# repo-template
Repositorio correspondiente al Grepo-template

# Cloud computing


# Descripción #

Este proyecto implementa una arquitectura en AWS utilizando Terraform. La arquitectura incluye los siguientes componentes:

- Una VPC con 2 subnets privadas
- VPC Endpoints
- Un bucket S3
- CloudFront
- API Gateway
- DynamoDB
- 2 funciones Lambda: GET y POST

# Prerrequisitos #

- Tener instalado el CLI de AWS y configurado con las credenciales de la cuenta de AWS correspondiente en el archivo ~/.aws/credentials.
- Tener instalado Terraform.

#  Arquitectura #

La arquitectura se compone de los siguientes recursos:

- VPC y Subnets (https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc)

Una VPC con 2 subnets privadas para alojar los recursos de manera segura.

- VPC Endpoints (https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint)

VPC Endpoints para facilitar la conectividad con servicios de AWS sin salir de la red privada. Se utiliza el meta argumento count para escalar fácilmente la cantidad de VPC Endpoints. Actualmente hay 2 configurados, pero este enfoque permite agregar más endpoints en el futuro sin esfuerzo adicional.

- Bucket S3 (https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket)

Un bucket S3 para el almacenamiento del Frontend (index.html) y el JavaScript (generated_script.js)

- CloudFront (https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution)
Una distribución de CloudFront para la entrega de contenido con baja latencia.

- API Gateway (https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_rest_api)

Un API Gateway que se utiliza junto con depends_on para asegurarse de que todos los recursos necesarios estén creados antes de implementar el API Gateway.

- DynamoDB (https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table)

Una tabla DynamoDB para almacenamiento de Vacuna_ID, name y Fecha.

- Funciones Lambda (https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function)

Dos funciones Lambda, una para operaciones GET y otra para operaciones POST.

# Meta Argumentos Utilizados #

   - count

Utilizado para crear múltiples VPC Endpoints de manera rápida y escalable. Este enfoque permite agregar más endpoints en el futuro sin modificar significativamente el código.

   - lifecycle

Utilizado para prevenir la eliminación accidental de la VPC mediante la configuración del atributo prevent_destroy.

   - depends_on

Utilizado en el API Gateway para asegurarse de que todos los recursos dependientes estén creados antes de implementar el API Gateway.

# Funciones Utilizadas #

   - format()

Utilizado para formatear la URL de invocación (invokeURL) de las funciones Lambda, que se pasa al script JavaScript que estamos generando en el archivo output.tf

   - element()

Utilizado para generar el invokeURL dentro del código.

   - len()

Utilizado para contar la cantidad de VPC Endpoints configurados mediante el meta argumento count. Estos ultmos dos en el archivo vpc_endpoints.tf

   - templatefile()

Utilizado para procesar archivos de plantilla en el archivo output.tf. Esta función permite insertar variables y generar contenido dinámico a partir de archivos de plantilla, facilitando la gestión de configuraciones complejas.

# MODULOS UTILIZADOS #

En el trabajo se utilizaron:

    a) Un modulo hecho por nosotros para la creacion de la vpc con dos subnets cada una en una AZ diferente.
    b) Un modulo hecho por nosotros para la creacion simultanea de las 2 lambdas que vamos a utilizar en el proyecto. En los archivos lambda_get.tf y lambda_post.tf
    c) En el punto anterior para la creacion de cada lambda se utiliza un modulo externo. Dicho modulo esta disponible en el link: https://registry.terraform.io/modules/terraform-aws-modules/lambda/aws/latest?tab=outputs 
    d) Un modulo externo para la creacion del Apigateway REST: https://antonputra.com/amazon/how-to-create-aws-lambda-with-terraform/#create-lambda-function-with-dependencies-access-to-s3-bucket