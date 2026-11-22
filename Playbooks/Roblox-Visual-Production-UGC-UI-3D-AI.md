# Producción visual profesional Roblox con IA: UI, UGC y 3D — RBLX LAB
**Versión:** 1.0 · **Investigación:** 2026-11-22 · **Tipo:** playbook transversal de arte, no archivo de código ni assets reales.
**Para:** GPT, Claude Code, Studio Assistant, Blender, Figma/Penpot, diseñadores y revisores.

## 0. Responder primero qué significa UGC
- **Assets internos del juego:** un sombrero, skin de espátula, zombie, marco de UI, decoración o accesorio usado **solo dentro de la experiencia**. Creación en Blender/Blockbench/Studio sin necesidad de listar el ítem globalmente en el Marketplace. Su compra en el juego, si la hay, se monetiza con los productos autorizados para la experiencia.
- **UGC de avatar en Marketplace:** un `Accessory`, ropa u otro ítem equipable en el avatar global fuera del juego. Tiene **especificaciones, elegibilidad, verificación/validación, moderación y posibles costes en Robux**, incluso si modelarlo es gratis. **NO** decir «publicar UGC es 100% gratis». Revisar la ficha vigente y elegibilidad de la cuenta antes de actuar.
- **UGC comunitario como referencia:** modelos/skins diseñados por otros. Verificar licencia individual, permiso de uso y que no sean copias de propiedades intelectuales o scripts desconocidos. Un modelo gratis no es automáticamente reutilizable/vendible como UGC global.

**Fuentes oficiales:** [Marketplace Publishing](https://create.roblox.com/docs/marketplace/publish-to-marketplace), [Marketplace fees](https://create.roblox.com/docs/marketplace/marketplace-fees-and-commissions), [Marketplace policy](https://create.roblox.com/docs/marketplace/marketplace-policy), [UGC validation](https://create.roblox.com/docs/marketplace/validation-system), [Rigid accessory](https://create.roblox.com/docs/art/accessories/creating-rigid).

## 1. Stack de creación sin suscripción (costo del software = 0)
| Uso | Elección inicial | Razón y límites |
|---|---|---|
| Entorno de juego, blockout, montaje | [Roblox Studio](https://create.roblox.com/docs/studio) | Gratis. Parts y operaciones nativas para P0; no sacrificar pruebas por arte. |
| Modelos 3D, UV, rigging, animación, export | [Blender](https://www.blender.org/) | Gratis/open source, fuente editable `.blend`. Formatos al importador FBX/glTF/OBJ. |
| Modelo muy simple low-poly | [Blockbench](https://www.blockbench.net/) | Gratis/open source, especialmente útil en primeras siluetas. Comprobar export por asset. |
| UI editable / sistema de componentes | [Figma Starter](https://www.figma.com/pricing/) o [Penpot](https://penpot.app/) | Figma tiene límites del plan Free; Penpot es opción open source. El archivo `.fig`/fuente editable NO es código Roblox. |
| Iconos, sprites, composición | [Inkscape](https://inkscape.org/), [Krita](https://krita.org/), [Photopea](https://www.photopea.com/) | Vector/raster/edición; usar PNG/SVG en el origen y exportar PNG a Roblox cuando corresponda. Revisar políticas de subida. |
| Packs de referencia | [Kenney](https://kenney.nl/assets), [Poly Haven](https://polyhaven.com/) | Los assets en páginas de Kenney y Poly Haven se publican CC0; conservar enlace/licencia descargada y verificar pack individual. Mezclar estilo sin copiar una marca. |
| Packs 3D adicionales | [Quaternius](https://quaternius.com/assets.html) | La FAQ refiere CC0, pero la licencia publicada actual define QAL con restricciones de redistribución de assets sueltos: registrar la licencia **del pack/versión**, NO asumir que se puede revender su modelo como UGC. |
| IA nativa (si habilitada) | [Roblox Studio Assistant](https://create.roblox.com/docs/assistant/guide) | Puede generar mallas y materiales y ayudar a editar Studio. Disponibilidad, cuotas y calidad cambian; verificar en tu Studio, revisar geometría, permisos y scripts. **No depender de uso ilimitado gratis.** |
| Control y coordinación | GPT (director de arte/QA) + Claude Code (implementación/scripts) + Git | No entrenar pesos; dar `Art Bible`, prompts, contratos y ejemplos aprobados con feedback en cada iteración. Para editar Studio se requiere conexión real/permiso. |

**Fuentes técnicas:** [Blender + Roblox](https://create.roblox.com/docs/art/blender), [Importer](https://create.roblox.com/docs/studio/importer), [AI on Roblox](https://create.roblox.com/docs/ai/accelerated-workflows), [UI Roblox](https://create.roblox.com/docs/ui), [Kenney CC0](https://kenney.nl/support), [Poly Haven CC0](https://polyhaven.com/license), [Quaternius FAQ](https://quaternius.com/faq.html) / [QAL](https://quaternius.com/license.html).

## 2. La forma realista de «entrenar» a GPT y Claude
**No se modifican los pesos de GPT/Claude mediante estos documentos.** Los condicionamos con contexto reproducible, guía del proyecto, ejemplos de PASS/FAIL y revisión humana. Una imagen bonita generada no equivale a modelo 3D editable, ni un boceto equivale a UI funcional.

### Archivos canónicos
1. **Aquí**: metodología general, fuentes y gates para cualquier juego Roblox.
2. **Cada repo de juego**: `docs/ART_DIRECTION_AI_ASSETS_*.md` (Art Bible específica), `art/design_tokens.json`, `art/ASSET_BRIEF_TEMPLATE.md`, `art/asset_manifest.json` y ejemplos aprobados. Evitar duplicar toda esta guía allí.
3. **IA de código**: `AGENTS.md` y `CLAUDE.md` deben señalar los archivos previos; un prompt solo cita las secciones relevantes, no cargar 30 KB por tarea.
4. **Referencias visuales**: guardar imágenes **solo cuando existan y haya derechos de uso**, con `refs/` y manifest. Un enlace no garantiza permiso. No adjuntar o subir fuentes sin haberlas revisado.

### Ciclo de 7 pasos de un asset
1. **Brief visual**: objetivo dentro del juego, palabras clave, escala en studs o UI, cantidad, comparables y limitaciones.
2. **Silhouette**: 2–3 opciones reconocibles en miniatura/desde cámara real, sin texturas; elegir una.
3. **Fuente editable**: .blend/.bbmodel/.fig/.svg + versiones; si fue generado con script, guardar script y parámetros. **Render PNG no es una malla**.
4. **Construcción y export**: colores/materiales de la biblia, UV/rig si corresponde, pivots, collision, formatos FBX/glTF/OBJ, nombres limpios, texturas optimizadas.
5. **QA automático y manual**: validar jerarquía, origen, dimensiones, triángulos, UV, deformaciones, transparencia y licencia. Probar en Studio móvil y desktop.
6. **Comparación A/B cualitativa**: screenshots reales lado a lado en tamaño de juego, no solo renders heroicos; registrar qué lectura mejora y qué queda confuso. No inventar resultados cuantitativos de usuarios.
7. **Commit y aprobación**: guardar fuente y export si derechos/performance lo permiten, versionar manifest y pruebas, asignar `APPROVED` solo tras revisión. Si no puede importarse, estado `BLOCKED`.

### Prompt base para GPT (brief/director)
```text
Actuá como director de arte Roblox senior. Antes de responder leé la Art Bible y el asset brief concreto del repo; no inventes archivos ni dimensiones.
TAREA: [asset/screen].
JUGADOR Y CÁMARA: [qué debe comprender a tamaño móvil].
GATES: 1) silueta 3 segundos 2) estilo consistente 3) legibilidad 3.º–4.º grado 4) coste móvil 5) fuente editable 6) licencia demostrable.
Proponé exactamente dos variantes, elegí una y entregá: brief de geometría/colores/texturas, medidas tentativas, refs verificables, estados/animaciones, planes de export y 5 casos de QA.
Si pido una imagen, generala como REFERENCIA 2D, sin afirmar que existe mesh .fbx/.blend. Terminá con incertidumbres y decisión GO/REWORK.
```

### Prompt base para Claude Code (implementación controlada)
```text
Repo: [owner/game]. Antes de tocar archivos leé AGENTS.md, docs/ART_DIRECTION_AI_ASSETS_*.md y art/design_tokens.json. Comprobá branch/remoto/estado, Place y conexión Studio/Rojo si vas a tocar Studio.
TAREA ÚNICA: [nombre asset/UI]. INPUT APROBADO: [brief / referencia con licencia / fuente].
ENTREGA: fuente editable real + archivo exportable si la herramienta disponible permite generarlo, jerarquía/nombres Roblox, componentes UI reutilizables o modelo importable. No conviertas un mockup PNG en UI falsa.
Mantener estilo, presupuesto propio de rendimiento y controles móviles. No scripts externos sin inspección. Si Blender/Studio no están instalados, entregar pasos/scripts auditables como PARCIAL, no simular que se probaron.
Ejecutar validación disponible; capturas de Studio SOLO si hubo acceso real. Actualizá asset_manifest, decisiones y changelog; commit/push verificado si hay permisos. Reportá archivos reales, QA PASS/FAIL, TODO y hash remoto.
```

### Prompt de QA adversarial (GPT)
```text
Revisá este asset como si fueras QA de un estudio de Roblox. Compará con la Art Bible y su brief. Buscá 10 defectos potenciales antes de elogiar nada: legibilidad móvil, forma/escala, proporción, contraste, consistencia, peso de geometría, texel density, pivot/collision, permisos/licencia y estados/interacciones. Clasificá cada defecto: BLOCKER/MAJOR/MINOR. Nunca digas que el archivo pasa una prueba que no pudiste realizar.
```

## 3. UI profesional en Roblox — implementar componentes, no capturas

- **Crear tokens globales**: primario/secundario, acento, tipografía, border radius, sombra, strokes, márgenes, hover/pressed/disabled, sonido, animación y escala.
- **Jerarquía visual**: una acción principal dominante (PLAY o HIT), CTA secundario, botones con nombre corto + icono; no más de un modal en la primera sesión. Menos texto para edades de 3.º–4.º grado.
- **En Studio**: `ScreenGui`, `Frame`, `TextButton/ImageButton`, `UIListLayout/UIGridLayout`, `UICorner`, `UIStroke`, `UIGradient`, `UIScale`, `UIAspectRatioConstraint`, `UITextSizeConstraint`; aplicar estilo centralizado por componentes o [Universal Styling / Style Editor](https://create.roblox.com/docs/ui/styling/editor) donde corresponda. `Scale + AnchorPoint` para layout; usar offsets cuando tengan sentido, no posicionamiento absoluto fijo.
- **Bordes de botones 9-slice** para elementos raster con esquinas que no se deforman: [Guía 9-slice](https://create.roblox.com/docs/ui/9-slice). Preferir componentes nativos sobre decenas de pngs.
- **Safe areas**: respetar notch, topbar/chat y controles táctiles nativos. No cubrir joystick ni salto. Ver [Cross platform](https://create.roblox.com/docs/projects/cross-platform) y [Adaptive design](https://create.roblox.com/docs/production/publishing/adaptive-design).
- **Estados obligatorios**: default, hover, focus/gamepad, pressed, disabled, loading, success, error; cerrar/back visible. No depender solo de rojo/verde; iconos y formas acompañan.
- **QA real**: móvil angosto, móvil grande, tablet y monitor/TV; gamepad focus, zoom de texto, modo alto contraste si disponible, 30 FPS y latencia. Primera acción completa sin tocar tienda.

## 4. 3D profesional Roblox — procesar y medir

**Pipeline:** blockout Parts Studio → silueta Blender/Blockbench → malla editable → UV/colores → export FBX/glTF → Importer Studio → pivots/collision/scale → prueba móvil → aprobación. [Importer](https://create.roblox.com/docs/studio/importer) soporta FBX, glTF y OBJ según tipo de modelo.

**Reglas creativas:** silueta reconocible desde cámara Roblox; cara/exageración legible; 3–5 colores controlados; detalles grandes, no microdetalles; materiales simples bien iluminados; escala proporcional a avatar estándar. Animaciones por función (idle/walk/hit/hurt) y SFX sincronizados. Reutilizar texturas/atlases y meshes cuando corresponde.

**Rendimiento:** Roblox documenta **máximo 20.000 triángulos por mesh común** (los avatars tienen presupuestos distintos). Ese máximo NO es un objetivo de calidad móvil. Presupuestos internos iniciales sugeridos (NO oficial): prop chico ≈ 300–1.000 tris, enemigo low poly ≈ 1.500–3.500 tris, boss ≈ 3.000–6.000 tris, accesorio simple ≈ 300–1.000 tris, textura normalmente 256–512, 1024 solo hero asset que lo justifique. Ver rendimiento real, densidad de instancias, draw calls, memoria, streaming, animaciones y LOD. Ajustar según profiler, no extrapolar de una malla sola.
**Collider:** usar colisiones simples transparentes o CollisionFidelity adecuada, no la malla visual detallada como colisión de cada diente de zombie.
**Para Avatar Marketplace UGC:** NO reutilizar las cifras de props; rigen las especificaciones de [accesorios rígidos](https://create.roblox.com/docs/avatar/rigid-accessories), [Avatar Setup](https://create.roblox.com/docs/avatar-setup) y [UGC validation](https://create.roblox.com/docs/marketplace/validation-system).

## 5. Licencias y seguridad
- Mantener `art/asset_manifest.json` con campos: id, uso, sourceURL, autor, license, rightsVerifiedDate, sourceFile, exportFile, triangles/texture, QA, status. Si falta licencia, asset = BLOCKED.
- Fuentes con CC0 verificables: Kenney y Poly Haven, pero **un asset 3D CC0 como placeholder de juego no equivale a un UGC de avatar propio para reventa**. En Quaternius revisar pack/licencia actual, hay diferencia pública entre FAQ CC0 y licencia QAL.
- Creator Store/Toolbox: inspeccionar contenido, Scripts, LocalScripts, ModuleScripts, RemoteEvents, plugins, enlaces externos, permisos y posibles backdoors. Insertar en Place de prueba primero; no instalar paquetes desconocidos. [Toolbox](https://create.roblox.com/docs/projects/assets/toolbox).
- NO copiar iconos, personajes, uniformes o marcas de otras experiencias o franquicias para vender UGC. No subir capturas de otros autores como assets propios.
- Studio Assistant/3D AI: resultado generado = borrador que exige revisar mallas, material, UV, licencia, moderación, colisión y rendimiento, nunca producto listo por defecto.

## 6. Aplicación ejemplo: DEFEND THE PIZZA!
**Fuente del juego:** [Art Bible y pipeline](https://github.com/ortizfram/DEFEND_THE_PIZZA_GAME/blob/main/docs/ART_DIRECTION_AI_ASSETS_V05.md). Dirección: **Toy-Food Apocalypse** (juguete pastel, pizza cálida gigante, zombie verde/menta gracioso, botones redondeados con contraste alto).
**Primera tanda**: pizza con ocho porciones, espátula ancha, zombie Munchie de dos golpes, una puerta legible; sólo después SHOP, STREET, FACTORY, loadout, UI Shop/Daily y accesorios de chef.
**UGC Marketplace posible más adelante**: gorro de chef con mini pizza o espátula-hat; primero prototipo interno de accesorio cosmético, luego validar elegibilidad, tarifa, derechos y requisitos globales antes de publicar. No lanzar UGC junto con P0.

## Fuentes de referencia y vigencia
- Roblox: [Art modeling specs](https://create.roblox.com/docs/art/modeling/specifications), [Artists onboarding](https://create.roblox.com/docs/onboarding/artists), [UI UX](https://create.roblox.com/docs/production/game-design/ui-ux-design), [Studio Assistant](https://create.roblox.com/docs/assistant/guide), [Tools/multiple platforms](https://create.roblox.com/docs/production/publishing/adaptive-design), [Creator Store](https://create.roblox.com/docs/production/creator-store).
- Blender: https://www.blender.org/ · Blockbench: https://www.blockbench.net/ · Figma: https://www.figma.com/pricing/ · Penpot: https://penpot.app/.
- Kenney: https://kenney.nl/support · Poly Haven: https://polyhaven.com/license · Quaternius current terms: https://quaternius.com/license.html.
- UGC Marketplace listing conditions/prices vary; verificar con fecha y cuenta antes de pagar.
