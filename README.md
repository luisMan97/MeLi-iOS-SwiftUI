# MeLi-iOS-SwiftUI

## Installation
Run git clone to download proyect

```ruby
git clone https://github.com/luisMan97/MeLi-iOS-SwiftUI.git
```

#### Third Party Libraries
The project does not use third party libraries. Don't cocoapods, don't cartage, don't worry :)

#### Funcionalidades
- La pantalla principal cuenta con una barra de búsqueda, cuando se realiza la búsqueda se realiza el llamado al servicio de manera automática.

![Alt text](/Resources/Products/search.gif "search")

- La pantalla principal consta de un listado en grilla de los productos traídos de la API de Mercado Libre.
- La pantalla principal cuenta con un botón que permite visualizar el listado también en forma de grilla de tres columnas o un listado vertical de una sola columna

![Alt text](/Resources/Products/button.gif "button")

- La pantalla principal cuenta con un skeleton cuando se está llamando el servicio y está cargando la información.

![Alt text](/Resources/Products/skeleton.gif "skeleton")

- Se muestra empty state cuando el usuario no ha realizado busqueda.

![Alt text](/Resources/Products/empty_state.png "empty_state")

- Se muestra empty state cuando no se encuentra resultados.

![Alt text](/Resources/Products/no_products.png "no_products")

- Se muestra mensaje de error cuando el servicio falla.

![Alt text](/Resources/Products/error.png "error")

- Se muestra mensaje de error cuando la conexión a internet falla

![Alt text](/Resources/Products/internet.png "internet")

- Cuando se selecciona un producto se va al detalle del producto.

![Alt text](/Resources/ProductDetail/detail.gif "detail")

- La pantalla del detalle cuenta con un listado horizontal de productos relaccionados.

![Alt text](/Resources/ProductDetail/related.gif "related")

- La pantalla del detalle cuenta con un botón de ver más, esté lleva a un web view con el sitio web del producto en mercado libre (se permite ingresar solo si hay internet).
- La pantalla del web view cuenta con un skeleton cuando está cargando el webview.

![Alt text](/Resources/ProductDetail/webview.gif "webview")

#### Funcionalidades técnicas:
- La aplicación está desarrollada en Swift 5, con SwiftUI, Combine, el último framework de Observable y Async/Await.
- La aplicación tiene cómo arquitectura un tipo de MVVM extendido (CLEAN Architecture).
- La aplicación usa programación reactiva con Combine.
- La aplicación implementa diferentes patrones de diseño (Repository, Factory, entre otros).
- La aplicación hace uso de inyección de dependencias.
- La aplicación hace uso de los principios SOLID.
- La aplicación no usa librerías de terceros.
- La aplicación contiene test unitarios de las casos de uso y viewmodels.
- La aplicación usa una capa genérica con URLSession para hacer los llamados a los servicios.  
- La aplicación tiene un método que imprime los errores de manera centralizada y solo para modo debug.
- La aplicación usa Codable para el mapeo de JSON a objetos. 
- La aplicación contiene un .gitignore para no subir archivos innecesarios.

#### Arquitectura
Se implementó CLEAN como arquitectura, con las siguientes capas:
1) View: Contiene las View de SwiftUI
2) Presentation: Contiene los ViewModels
3) Interactor/UseCases: Contiene los casos de uso (acciones de la aplicación y lógica de negocios)
4) Entity/Domain: Contiene las entidades
5) Data: Contiene el patrón repository para obtener los datos ya sea de una API o una base de datos local
6) Framework: Contiene la implementación a más detalle de la obtención de datos usando ya la respectiva librería o framework (URLSession, CoreData y etc)
