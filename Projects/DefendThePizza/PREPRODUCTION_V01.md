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
