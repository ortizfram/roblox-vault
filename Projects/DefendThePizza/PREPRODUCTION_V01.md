# DEFEND THE PIZZA! — Preproducción de gameplay + empaque V0.1

**Fecha:** 2026-11-21  
**Estado:** propuesta de diseño, **NO** juego implementado; no se han creado assets finales ni aprobado gasto/publicación.  
**Entrada de investigación:** [GameIdeasForRoblox.md — IDEA-005](../../GameIdeasForRoblox.md)  
**Fuente de criterios:** [CampaingsAndPreGameCreation.md](../../CampaingsAndPreGameCreation.md) §1–2 y [AGENTS.md](../../AGENTS.md).

## 1. Qué está decidido / qué es una hipótesis

### Decidido por propietario
- Título: **Defend the Pizza!**
- El propietario investigó la keyword **Defend** en Creator Exchange y comprobó su nivel de comprensión aproximadamente **Grade 3–4**. No se archivan números, links ni capturas originales de esa verificación; no inventarlos.
- Avanzar a **creación/preproducción** bajo las reglas del Roblox Vault, sin autorización implícita de anuncios ni publicación.

### Hipótesis de producto, para jugar y revisar
- **Core fantasy**: «Soy un chef pequeño; defiendo una pizza gigante de monstruos hambrientos antes de que se la coman».
- **Género**: defensa cooperativa arcade con golpes físicos y persecución; **NO** tower defense pasivo.
- **Target funcional**: comprensible para chicos con lectura de 3.º–4.º grado, controles móvil primero; propuesta técnica inicial **1–6 jugadores**, compatible PC/móvil y después consola.
- **Diferencial prioritario**: los monstruos pueden **arrancar una porción y huir**. Se puede recuperar golpeando al ladrón antes de que llegue a la salida.
- **Test de diversión**: con un solo tipo de monstruo, una espátula y bloques grises, pegar y defender durante 30 segundos tiene que resultar divertido.

## 2. Promesa de la miniatura / composición A (no es imagen final)

- **Formato**: 16:9, objetivo **1920×1080** (referencia [Roblox thumbnails](https://create.roblox.com/docs/production/publishing/thumbnails)).
- **Sujeto dominante**: pizza de pepperoni GIGANTE sobre una mesa, ocupando centro ~50 %; una porción evidentemente faltante.
- **Acción izquierda primer plano**: avatar chef pequeño con espátula desproporcionada, en el instante del impacto; movimiento diagonal de izquierda a derecha.
- **Amenaza derecha**: monstruo cómico de boca ancha sujetando una porción triangular y girando para huir; dos monstruos más atrás solo si no ensucian lectura.
- **Consecuencia visible**: queso elástico estirándose desde la pizza, uno o dos enemigos volando, una porción faltante.
- **Estilo**: juguetes 3D low-poly limpios, cocina luminosa, amarillo de queso/rojo tomate contra verde menta/azul de monstruos. Contornos fuertes, expresiones simples; sin logos ajenos ni miedo/gore.
- **Texto**: preferir ningún texto sobre la imagen porque el título ya dice la acción; opción de prueba máxima 2 palabras «SAVE IT!» si hace falta. No colocar información esencial en franja inferior tapable por metadatos.
- **Veracidad**: escena recreable con el gameplay final; no publicar una imagen que prometa mecánicas ausentes. La miniatura para validar V0.1 no es anuncio listo.
- **Composiciones de contraste**: B = primer plano de monstruo a punto de tragarse última porción; C = chef golpea a ladrón que está escapando con porción. A es el candidato inicial por explicar mejor juego.

## 3. One-page gameplay

**Verbo primario:** GOLPEAR.  
**Acción secundaria opcional:** PERSEGUIR / RECUPERAR.  
**Core loop:** monstruos llegan → golpe de espátula con empuje cómico → salvar porciones o recuperarlas → monedas/recompensa → mejora significativa → siguiente oleada.

**Espacio**: una sola cocina gigante y bien iluminada, mesa/plataforma central circular con pizza muy visible, **3 rutas de entrada** (N/E/O), un área de salida de ladrones en borde del mapa, bordes seguros; toda acción visible desde cámara Roblox estándar con distancia controlada. Evitar un mapa gigante y pasillos ocultos.

**Pizza**: estado visual por **8 porciones**. La pizza se daña cuando un monstruo alcanza la mesa y muerde; porción perdida visible de inmediato. En primera versión, cada porción puede ser unidad de vida (8 puntos); el sistema puede evolucionar a salud por porción solo tras test. Un ladrón que toma una porción crea un estado `stolen` recuperable hasta cruzar la salida; después pasa a `lost`. Evitar duplicar premio o crear porción al recuperar dos veces.

**Movimiento y combate**: moverse/correr/saltar normal, botón grande de golpe/espátula en móvil, click en PC, trigger en consola. Ataque con hitbox en arco amplio al frente, telegráfico, cooldown breve; efectos inmediatos de sonido/impulso al impactar. Servidor determina golpes válidos, daño, knockback, recompensas y cambio de dueño de porción; animación local puede adelantarse para dar sensación de respuesta. Nada de precisión fina de mouse.

**Enemigos** (progresivos, no todos en P0):
- Munchie: corre hacia pizza, mordisco lento; se desplaza al ser golpeado. Primer enemigo para medir si el ataque es divertido.
- Thief: roba 1 porción y escapa; recuperar la porción con un golpe antes de salida, escena social/clipeable. Diferenciador P1.
- Big Eater: lento pero cuesta empujarlo; amenaza telegráfica. P2 solo si los dos anteriores funcionan.

**Rounds / olas**: cinco oleadas para MVP, duraciones tentativas de 20–40 segundos + compra rápida de ~8 segundos, ajustadas tras jugar. En modo 1 jugador, menos enemigos y velocidad accesible; al unirse amigos escalar oleadas sin cambiar demasiado el tiempo a primer golpe. Ganar por mantener ≥1 porción al terminar ronda final. Perder cuando se agota pizza; mostrar resumen corto, mejor oleada y reintentar en ≤5 s. Sin salas de espera largas ni dependencia de servidor lleno.

**Upgrades iniciales**: entre oleadas, elegir solamente una mejora perceptible, por ejemplo espátula más grande o más empuje. No introducir árbol de 20 upgrades, poderes ni tienda Robux antes de que el loop pase pruebas. Recompensa visual inmediata al salvar oleadas; progreso cosmético persistente solo cuando esté validado.

## 4. First-time user experience (FTUE) diseñado, no probado

| Tiempo objetivo | Qué ocurre | Qué debe entender |
|---|---|---|
| 0–5 s | Aparece en cocina frente a pizza enorme, chef lleva espátula; monstruos se ven venir | «Debo defender esta pizza» |
| 5–10 s | Primer Munchie a distancia de golpe; UI muestra botón de espátula y flecha contextual | «Le pego para alejarlo» |
| ≤30 s | Primer golpe con knockback y feedback audible; moneda/reconocimiento | «Pegar sirve y es divertido» |
| ≤60 s | Primer bocado/porción arrastrada o situación de casi pérdida; jugador puede impedirla | «Hay consecuencias visibles» |
| ~2–3 min | Primera recompensa de oleada y upgrade claro | «Puedo volver a defender mejor» |

Son **objetivos de diseño**, no resultados observados.

## 5. Tres momentos que deberían producir clips
1. Alguien golpea al ladrón justo antes de escapar y la porción sale volando de vuelta a la mesa.
2. Dos amigos encadenan golpes y empujan un Big Eater al otro lado de la cocina sin romper controles.
3. Queda una sola porción, aparecen enemigos por dos puertas, el equipo salva la ronda en el último instante.

Si estos momentos no ocurren de manera natural en pruebas, rediseñar las mecánicas; no crear VFX falsos para simular diversión.

## 6. Producción por gates — no construir lo accesorio

**Gate 0 — packaging y alcance (actual):**
- 1 frase de core fantasy, un core loop de 30 s, una miniatura storyboard A + B, una cocina simple, un enemigo, espátula, pizza que pierde salud.
- El propietario elige/ajusta la dirección visual, y se contrasta competencia directa.
- Resultado: decisión de pasar a graybox, no publicación.

**Gate 1 — P0 graybox en Studio con Claude Code (no ejecutado):**
- Crear **proyecto aislado**, Git, `Config` central, copia de seguridad y sincronización controlada; no modificar otros juegos del usuario.
- Una cocina gris, pizza de 8 porciones visuales, 3 spawns simples, un enemigo Munchie, ataque/knockback, ronda de 30 s, ganar/perder, controles móviles.
- Analytics desde el primer código. QA 1 y 2 clientes, teléfono, baja concurrencia, latencia, respawn.
- **Criterio**: golpear se siente bien y se ve claramente el daño a la pizza. Si no, no avanzar.

**Gate 2 — ladrón + recuperación (no ejecutado):**
- Añadir Thief, ruta de escape, `stolen→recovered/lost` 100 % servidor, una nueva oleada y un upgrade.
- QA de carrera entre robar/depositar/golpear/ser destruido, casos de desconexión; clip natural con amigos.
- **Criterio**: divertido como experiencia diferenciada, no frustrante o difícil de leer.

**Gate 3 — primeras sesiones (no ejecutado):**
- 5 olas, escalado 1–6 jugadores, instrucciones mínimas, mejoras, retry instantáneo, sonido y VFX, guardado únicamente si necesario.
- Playtest de 3–5 niños/jugadores sin explicación: acción entendida ≤10 s; premio ≤30 s; momento divertido ≤60 s; deseo de repetir; registrar abandonos.
- Comparar FTUE, ronda completada, retry, móvil y errores; D1/sesión reales solo al haber usuarios y datos del dashboard.

**Solo tras pasar estos gates**: arte final, progresión persistente, cosméticos, más contenidos y evaluación de anuncios con autorización explícita.

## 7. Analítica mínima — servidor y versión

Versión `DTP_V01`. Los eventos se proponen, no están implementados. 
- Funnel `DTP_FTUE`: `Joined` → `FirstAttackValidated` → `FirstKnockback` → `FirstWaveCompleted`; **registrar solo en orden cuando realmente sucede**, sin marcar pasos inexistentes. Si primera ronda termina sin golpe, esa ruta debe quedar reflejada como abandono, no forzar completado.
- Funnel `DTP_REPLAY`: `RoundFinished` → `NextRoundStarted` por mismo intento/usuario de forma apropiada. 
- Custom `DTP_PizzaSliceLost`, `DTP_ThiefEscape`, `DTP_SliceRecovered`, `DTP_PlayerAttackMiss` (muestreado, no cada frame), `DTP_WaveFailed`, con campo de versión y dispositivo cuando esté disponible sin registrar datos personales.
- Medidas: primer golpe / nuevos joins; primer knockback / primer golpe; primera oleada / participantes; replay / rondas terminadas; ratio de robos recuperados / robos; tiempo al primer valor. Guardrails: errores, latencia, device failures, balance solo vs grupo.
- Roblox AnalyticsService requiere publicación y emisión servidor para datos reales; en Studio debug local/mock y posterior verificación en Creator Hub. Respetar límites de eventos/campos ya documentados en nota RBLX de analytics.

## 8. Riesgos, competencia y preguntas abiertas

- **Dodo Pizza World** (https://www.roblox.com/games/85791481965714/Dodo-Pizza-World) anuncia entre otras cosas defensa de torres; muestra competencia **adyacente**, no demuestra copia exacta ni ausencia de un título igual. Faltan visitas/CCU y auditoría completa para la fantasía defensa física de pizza.
- El título/keyword aprobado por el propietario **no** prueba por sí solo 3M/rating del original ni D1 futuro.
- Robo de porciones + NPC AI + física puede exceder prototipo de 2–3 días; priorizar P0 divertidísimo antes de agregar thief.
- El golpe tiene que funcionar bien en móvil sin apuntar pixel perfect; IA de pathfinding no debe generar atascos en rutas.
- Arte final, precio de productos, ingresos, monetización y publicidad están **fuera de alcance** de V0.1.

**Próximo entregable real:** storyboard thumbnail A con prueba visual 16:9 + graybox mínimo jugable. Esta nota no equivale a una thumbnail PNG ni a un juego implementado.

## 9. Repositorio de código y sincronización — actualizado 2026-11-21

- **Repositorio confirmado y sincronizado:** [ortizfram/DEFEND_THE_PIZZA_GAME](https://github.com/ortizfram/DEFEND_THE_PIZZA_GAME), rama `main`, commit remoto verificado **`360e564f449de1f09f3d50e9e39dbe99728344e5`** (19 archivos).
- **Visibilidad encontrada: PÚBLICO**, aunque el plan original decía privado. El usuario debe cambiar visibilidad en GitHub Settings → General → Danger Zone si lo quiere privado. No se incluyeron secretos.
- Se subieron README, AGENTS, CLAUDE, estructura Rojo, Luau de bootstrap, `Config`, diseño, roadmap, analíticas, QA, `docs/SYNC_POLICY.md`, `tools/sync_repo.ps1` y validación GitHub Actions. Es **scaffold sin gameplay funcional**, no versión de Studio.
- La historia original del remoto (README creado en GitHub) fue **preservada**, sin forzar branch. El ZIP local anterior tiene historial Git independiente y **no se debe usar para hacer `git push` directamente**. Para desarrollar en Windows, usar `git clone https://github.com/ortizfram/DEFEND_THE_PIZZA_GAME.git`.
- Se verificó `main` mediante lectura posterior al commit, árbol de 19 archivos, README y política de sincronización. La comprobación estática del starter pasó localmente antes de subir; **Roblox Studio no se probó**.
- **Proceso futuro:** cada sesión autorizada empieza revisando la rama/remote y termina con commit y push verificado; no existe sincronización automática desatendida. `roblox-vault` contiene metodología e investigación, el repositorio del juego contiene código/progreso. GitHub no sincroniza Roblox Studio LIVE sin verificar Rojo/MCP y Place.

## 10. Monetización — plan de producto, NO activada (2026-11-21)

- **Documento fuente en el repo de código:** [MONETIZATION_PLAN_V1.md](https://github.com/ortizfram/DEFEND_THE_PIZZA_GAME/blob/main/docs/MONETIZATION_PLAN_V1.md); commit verificado `4dca2bedd60a8fa0694d7b626a1083dd42806bba`.
- Propuesta centrada en personalización cosmética sin ventajas: Crazy Chef Pack (49 R$), Golden Spatula Pack (79 R$), Pizza Party Celebration consumible posterior a victoria (19 R$), Master Chef Supporter (149 R$). **Precios tentativos**, mostrar precios regionales reales en UI; no se crearon IDs ni productos.
- **Cuándo:** G0 planificar; G1/G2 sin venta; G3 tienda demostrativa sin compra; G4a dos pases tras diversión y métricas verificadas y autorización explícita; G4b celebración tras ganar con ProcessReceipt idempotente; G5 Supporter si hay retención real y demanda. No vender reparaciones/daño/poder y no colocar prompts en derrota.
- Cada fase tiene métricas de apertura, intención, compras confirmadas, datos de retención D1/D7 y QA de entrega. Monetización requiere autorización explícita y no reemplaza gameplay divertido.

## 11. Propuesta V0.2: zombies atacan chefs y pizza, rescate y revive (2026-11-21)

- **Nueva propuesta del propietario:** además de amenazar la pizza, algunos zombies podrían atacar a los jugadores para que existan caídas, rescates cooperativos y una posible opción de revive pago. No se confirmó estética definitiva de zombies frente a monstruos hambrientos.
- **Documento de diseño y monetización en el repo del juego:** [COMBAT_AND_REVIVE_V02.md](https://github.com/ortizfram/DEFEND_THE_PIZZA_GAME/blob/main/docs/COMBAT_AND_REVIVE_V02.md), commit confirmado `edff5c4d4057a56bdd3fec3b63c65bee54c1ee08`.
- Recomendar zombie común con objetivo primario pizza, contraataque a chef que lo intercepte; ladrón sigue concentrado en porciones. Sin convertir toda IA en perseguidores de jugadores.
- **Propuesta de downed:** 3 corazones iniciales, rescate gratis por compañero manteniendo botón ~2 s, reaparecer gratis en ≤10–12 s; nunca espectar toda la ronda. El equipo pierde si se acaba la pizza, no por quedarse caídos temporalmente.
- **Revive pago solo hipótesis posterior:** un Developer Product consumible de revive inmediato, 19 Robux ilustrativos, sin presión automática ni bloqueo del camino gratuito; preservar crédito si el pago llega tarde, recibos idempotentes. Riesgo pay-to-win: no activar sin playtest de retención y autorización comercial expresa.
- Todo es **documentación, NO implementado** en Roblox Studio. Probar diversión de golpes, daño y rescate antes de diseñar la compra.

## 12. Tres mapas + objetivos de bloqueo — concepto V0.3 (2026-11-21)

- **Diseño detallado en el repo del juego:** [MAPS_AND_OBJECTIVES_V03.md](https://github.com/ortizfram/DEFEND_THE_PIZZA_GAME/blob/main/docs/MAPS_AND_OBJECTIVES_V03.md), rama `main` sincronizada y verificada en commit `ae187cfcd87ececb646e378bce015a765ece5ba1`.
- **Regla única:** SAVE THE PIZZA; zombies vienen por rutas y pueden atacar chefs que los interceptan; defender con espátula HIT + un solo botón ACT contextual (incluye HELP gratis a compañeros caídos).
- **Mapa 1 Pizza Shop:** cerrar/reparar puertas o persianas (`CLOSE/FIX`). Primero prototipo Shop con una puerta, zombie, pizza y golpe.
- **Mapa 2 Pizza Street:** empujar un auto/contenedor a una posición marcada para tapar callejones (`PUSH`), sin puzzles de físicas manuales.
- **Mapa 3 Pizza Factory:** pulsar botones de ventiladores para alejar zombies por tiempo limitado (`PRESS`), sin mezclar máquinas y acertijos.
- Cada interacción debe retrasar a los enemigos, nunca bloquearlos para siempre o sustituir el combate. Metas secundarias fáciles y opcionales; el equipo pierde únicamente cuando se acaba la pizza.
- **Legibilidad objetivo 3.º–4.º grado:** una palabra nueva por mapa; íconos y animación antes que texto; a lo sumo 1 alerta prioritaria; probar con personas que no conozcan el juego. No afirmar que CLOSE/PUSH/PRESS tienen una clasificación de lectura verificada sin fuente.
- Progresión 3/4/5 oleadas sugeridas, valores no balanceados ni aprobados. Street y Factory no se construyen antes del playtest de Shop. No se crearon mapas reales en Roblox Studio ni assets ni monetización.

## 13. Blueprint V0.4 — carga, lobby, rewards, daily, combate, físicas, animaciones y música (2026-11-21)

Se desarrolló un **Game Design de experiencia completa** para Defend the Pizza, conservando el alcance P0 pequeño y sin implementar aún scripts funcionales. **Fuente canónica del detalle en el repo del juego:**
- [PLAYER_JOURNEY_UI_V04.md](https://github.com/ortizfram/DEFEND_THE_PIZZA_GAME/blob/main/docs/PLAYER_JOURNEY_UI_V04.md): loading de datos real, PLAY rápido, lobby/pizzería, SHOP y LOADOUT (3 slots estéticos), menú DAILY, HUD táctil, final de partida y cutscenes saltables de 0.5–3 s.
- [COMBAT_PHYSICS_ANIMATION_V04.md](https://github.com/ortizfram/DEFEND_THE_PIZZA_GAME/blob/main/docs/COMBAT_PHYSICS_ANIMATION_V04.md): tap slap 1 HP, hold charged opcional 2 HP, impactos con knockback/ragdoll breve; zombies Runner 1 HP, Munchie 2, Thief 2, Big Eater 5, jefe opcional 12. Player 3 corazones y respawn gratis rápido, pizza 8 porciones. Números **hipótesis de balance**.
- [REWARDS_DAILY_AUDIO_V04.md](https://github.com/ortizfram/DEFEND_THE_PIZZA_GAME/blob/main/docs/REWARDS_DAILY_AUDIO_V04.md): Coins por oleada y mapa + Chef XP/level, cosméticos de Coins gratuitos, 3 daily quests UTC con metas solo-jugables, idempotencia de rewards/UpdateAsync, música original o autorizada y SFX legibles.
- Documentos de resumen actualizados: GAME_DESIGN, ROADMAP, DECISIONS, ANALYTICS_SPEC, AGENTS, README, CHANGELOG.

**GitHub juego rama main:** commit leído de vuelta y verificado `a3b3a25e9ad602e8dd99372e4b4dfd92a7fb975a` (2026-11-21).

**Principios transferibles:** loading verdadero/no barras falsas; no bloquear primera partida con menús; misión visual consistente; 1–5 golpes claros por enemigo común/elite; físicas exageradas breves sin causar lag móvil; no recompensar last hits o farm AFK; dailies siempre factibles solo; tienda solo después de diversión/retención y autorización, nunca monetizar esperar largo por revive; audio original/licenciado, notificaciones cortas, accesibilidad y cutscenes breves/saltables.

**Gate:** un zombie de 2 golpes, un chef con tap slap, una pizza con daño visible y una puerta del mapa Shop siguen siendo el primer prototipo. Nada de estos documentos implica que haya menús, música, assets, cutscenes, misiones o data stores en Roblox Studio todavía.

## 14. Arte, UI, UGC y producción visual con GPT + Claude — V0.5 (2026-11-22)

- **Playbook general reutilizable en el Vault**: [Producción visual Roblox con IA — UI, UGC y 3D](../../Playbooks/Roblox-Visual-Production-UGC-UI-3D-AI.md), con stack gratuito, Blender/Blockbench/Figma/Penpot, Studio Assistant, permisos y costes reales del Marketplace, proceso de briefs, prompts, QA de import/rendimiento/licencias. Actualización general guardada en commit `c8676408eb05353082eeef217162c51d65cca953`.
- **Dirección artística propia del juego**: [ART_DIRECTION_AI_ASSETS_V05.md](https://github.com/ortizfram/DEFEND_THE_PIZZA_GAME/blob/main/docs/ART_DIRECTION_AI_ASSETS_V05.md): estilo propuesto **Toy Pizza Panic**, pizza cálida y protagonista, zombies verdes y menta grandes/expresivos, chef diminuto con espátula gigante, UI de alto contraste y formas redondeadas.
- **Materiales para ambas IAs en el repo de juego**: [tokens UI](https://github.com/ortizfram/DEFEND_THE_PIZZA_GAME/blob/main/art/design_tokens.json), [manifest de assets/estatus/licencias](https://github.com/ortizfram/DEFEND_THE_PIZZA_GAME/blob/main/art/asset_manifest.json), [plantilla de brief](https://github.com/ortizfram/DEFEND_THE_PIZZA_GAME/blob/main/art/ASSET_BRIEF_TEMPLATE.md) y [prompts GPT/Claude](https://github.com/ortizfram/DEFEND_THE_PIZZA_GAME/blob/main/art/AI_ASSET_PROMPTS.md). GitHub del juego, commit verificado `df5791b880193927be0bb528ef3c2c87c3902e8a`.
- **QA automático inicial** en el repo de código: `tools/validate_art_manifest.py` enlazado a GitHub Actions, revisa token JSON y que no haya assets declarados falsamente como aprobados sin archivos y evidencia. No sustituye un test real en Blender/Studio ni demuestra que CI pasó sin comprobar runs.
- **Prioridad**: P0 una pizza con ocho porciones, una espátula, un zombie Munchie de dos golpes, una puerta y botón HIT. Los 8 assets del manifest están en `PLANNED`: NO hay mallas editables, exports, screenshots, UI funcional ni UGC publicado por el hecho de documentarlos.
- **Distinción UGC**: cosméticos de chef usados dentro de la experiencia ≠ ítems de avatar vendidos en Marketplace; la última opción exige comprobación de elegibilidad, especificaciones, tarifas, moderación y autorización. El software gratuito no elimina estos costes.
- **Método de IA**: manual + tokens + briefs + revisión con ejemplos aprobados **no reentrena pesos** de GPT/Claude; establece un pipeline repetible. No ejecutar cambios de Studio, compras, publicación ni anuncios por esta documentación.

## 15. Primer Zombie Munchie — instalación Windows y variantes A/B (2026-11-22)

- Guía práctica del juego: [SETUP_WINDOWS_FIRST_MUNCHIE.md](https://github.com/ortizfram/DEFEND_THE_PIZZA_GAME/blob/main/docs/SETUP_WINDOWS_FIRST_MUNCHIE.md), GitHub repo `ortizfram/DEFEND_THE_PIZZA_GAME` `main` commit remoto verificado `dfce5cfffdcbb2d6b7728a9dac13e972c22d338a`.
- Descargas oficiales recomendadas: Blender y Roblox Studio (imprescindibles para mesh/import), Git + VS Code para repositorio, Claude Code opcional (software instalable, **uso no necesariamente gratuito, requiere acceso compatible**), Rojo CLI+plugin cuando se sincronicen scripts Luau; Blockbench opcional. Python viene integrado en Blender.
- **Dos diseños pendientes de producir realmente:** `Munchie Round` A (cabeza grande, cuerpo bajo/ancho, brazos cortos, lectura de móvil favorable) y `Munchie Noodle` B (alto/delgado, brazos largos, más expresivo pero posible confusión con Runner). A es **preferida provisional**, decisión final tras comparar dos .blend auténticos/capturas verificadas a ~100 px.
- Workflow: crear dos fuentes `.blend` distintas mediante Blender/manual/script Python, comparar silueta, aprobar una, exportar FBX/glTF, comprobar escala y rig en Roblox Studio de prueba. Mesh estático ≠ NPC animado; se necesitan rig/animaciones/scripts aparte.
- No declarar creado ni publicado ningún asset; el manifest continúa con 8 registros `PLANNED` a la fecha de esta guía. No hay Place conectado ni installations verificadas en PC.
