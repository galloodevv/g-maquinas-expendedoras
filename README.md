**Fivem Vending Machines Script 🍹🛒**

¡Bienvenido a tu **script de máquinas expendedoras** para FiveM! 🚀 Este recurso te permite colocar máquinas expendedoras en tu servidor y ofrecer bebidas y snacks a tus jugadores de forma sencilla y personalizable.

---

## 📄 Descripción

Este script en **Lua** crea un sistema dinámico de máquinas expendedoras. Los jugadores podrán interactuar con los modelos configurados, ver un menú con los artículos disponibles, elegir la cantidad y efectuar la compra, descontándose el dinero de su cuenta y añadiendo los ítems a su inventario.

---

## ✨ Características

- ✅ Soporte para múltiples modelos de máquina expendedora (`prop_vend_soda_01`, `prop_vend_snack_01`, etc.).
- 🛍️ Menú interactivo con íconos y descripciones de precio.
- 💸 Integración con **ESX** y sistemas de inventario (`ox_inventory` o inventario por defecto).
- 🎯 Validaciones de distancia, estado del jugador y vehículo.
- 🔔 Notificaciones al jugador en caso de éxito o error.
- 🔧 Fácil configuración de artículos, precios, cuenta y tipo de inventario.

---

## 🛠️ Instalación

1. Copia la carpeta del recurso (`g-maquinasexpendedoras`) en tu directorio de recursos de FiveM.
2. Añade la línea siguiente en tu `server.cfg`:
   ```
   ensure g-maquinasexpendedoras
   ```
3. Reinicia tu servidor o recarga el recurso:
   ```
   restart g-maquinasexpendedoras
   ```

---

## ⚙️ Configuración

En el archivo `config.lua` encontrarás varias opciones:

```lua
Config = {
    -- Lista de artículos en la máquina con etiqueta, valor interno y precio.
    Items = {
        { label = 'Agua',        value = 'water',  price = '12' },
        { label = 'Pan',         value = 'bread',  price = '18' },
        { label = 'Hamburguesa', value = 'burger', price = '14' },
    },

    -- Modelos de máquinas expendedoras permitidos
    VendingMachines = {
        `prop_vend_soda_01`,
        `prop_vend_soda_02`,
        `prop_vend_soda_06`,
        `prop_vend_snack_01`,
        `prop_vend_water_01`,
    },

    -- Cuenta de ESX para descontar dinero ('money', 'bank', etc.)
    Account = 'bank',

    -- Tipo de inventario: 'ox_inventory' o 'default'
    Inventory = 'ox_inventory',
}
```

- 🏷️ **Items**: Agrega o quita artículos con su `label`, `value` y `price`.
- 🎛️ **VendingMachines**: Incluye los hashes de los props de FiveM que actuarán como máquinas.
- 💳 **Account**: Configura si el dinero se tomará de la cuenta bancaria o de bolsillo.
- 📦 **Inventory**: Selecciona tu sistema de inventario.

---

## 🚀 Uso

1. Coloca una máquina expendedora en tu mapa (en modo mapeo o con comandos).
2. Inicia tu servidor y acércate a la máquina.
3. Presiona **E** para abrir el menú.
4. Elige el producto y la cantidad.
5. Confirma tu compra y recibe tu artículo. 🎉

---

## 🧩 Contribuciones

¡Las contribuciones son bienvenidas! 🤗

- Forkea el repositorio.
- Crea tu rama de feature: `git checkout -b mi-nueva-feature`.
- Haz commit de tus cambios: `git commit -m "Añadir mi feature awesome"`.
- Envía un Pull Request.

---

## 📝 Licencia

Este proyecto está bajo la licencia MIT. ¡Disfruta y comparte! 💖

---

© 2025 GallooDevv - ¡Gracias por usar este script! 🌟
