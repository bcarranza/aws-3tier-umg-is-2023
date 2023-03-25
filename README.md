# aws-3tier-umg-is-2023
- AWS in 3 capas desplegado en terraform.

# Configuración
- variables de configuración 

```
export AWS_ACCESS_KEY_ID="TU_ACCESS_KEY"
export AWS_SECRET_ACCESS_KEY="TU_SECRET_KEY"
```

# Como crear la infraestructura.
```
terraform init
terraform plan 
terraform apply
```

# Como destruir la infraestructura.
```
terraform destroy
```

# Infrastructura esperada
![](./img/infra.png)
