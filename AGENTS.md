# AGENTS.md — Roblox Vault: instrucciones para todas las IAs

## Objetivo

Este repositorio es la **fuente de verdad sobre investigación y marketing de Roblox de RBLX LAB**, separada de los repositorios de código de cada juego. Se creó para **ahorrar créditos/tokens**: nunca hacer un escaneo entero ni repetir búsqueda web sin necesidad. Leer primero un índice mínimo y solo los capítulos del problema.

## Mapa de lectura (routing determinista)

| Intención del usuario | Leer EXACTAMENTE | No leer salvo que se necesite |
|---|---|---|
| Encontrar juego, validar demanda, Flash, rating, saturación | [GameIdeasForRoblox.md](GameIdeasForRoblox.md) §1, §3, §4, §7–8 | Guía de campañas completa |
| ¿Qué es core fantasy? ¿Cómo elegir título/thumbnail? | [CampaingsAndPreGameCreation.md](CampaingsAndPreGameCreation.md) §1–2 | Backlog de Flash |
| ¿Cuándo anunciar? ¿Cuánto gastar? ¿Alcance 16+? | [CampaingsAndPreGameCreation.md](CampaingsAndPreGameCreation.md) §3, §9 | Investigación de juegos originales |
| Analizar campaña real, CTR, CPP, ROAS, D1, Home impressions | [CampaingsAndPreGameCreation.md](CampaingsAndPreGameCreation.md) §4–5 + [Templates/CampaignReviewTemplate.md](Templates/CampaignReviewTemplate.md) | Búsqueda general de ideas |
| Construcción con IA, instrumentación | Notas RBLX LAB Analytics-First del vault persistente + [GameIdeasForRoblox.md](GameIdeasForRoblox.md) §1C, §3; si hace falta §5 de campañas | Ads hasta que el juego retenga |
| ¿Qué investigación ya se hizo? | [GameIdeasForRoblox.md](GameIdeasForRoblox.md) §5, §8 y changelog | Consultar de cero fuentes externas |

**Inicio para cualquier IA:** leer este archivo, después solo las secciones pertinentes. No necesita cargar todo el repositorio en cada conversación.

## Política de costo/tokens: presupuesto de búsqueda

1. **Cache first:** buscar la respuesta en los archivos mapeados. El usuario quiere que este vault tenga decisiones, experiencias, fuentes y fechas, no investigación repetida.
2. **Reusar referencias exactas:** si el archivo ya tiene URL, métrica y fecha suficientemente recientes para la pregunta, usar esos valores con marca temporal.
3. **Web solo cuando haya un hueco factual o cambio de actualidad** (por ejemplo elegibilidad, costos de publicidad, CCU/visitas, nuevas normas, estadísticas recientes). No consultar Google por definiciones archivadas.
4. **Agrupar búsquedas por hipótesis**, no por variaciones triviales. Detenerse en evidencia suficiente para PASS/FAIL; si no se puede comprobar, registrar UNKNOWN.
5. **No volver a descargar subtítulos** del video patrocinado: fuente estable [Prepublish](https://prepublish.ai/youtube-transcript/owMnhg3fn_M); su síntesis en [CampaingsAndPreGameCreation.md](CampaingsAndPreGameCreation.md). Consultar subtítulos solo ante dudas de atribución o detalle no cubierto.
6. **No inventar** datos de ads, visitas, niveles lectores, D1/D7, tendencias o fotos. Marcar desconocido y registrar el **dato mínimo faltante**.
7. **No leer todos los archivos** por defecto, ni abrir todos los juegos de la lista. Responder con la evidencia de la nota y una investigación incremental focalizada.
8. Para cada información de actualidad, almacenar fecha + URL + fecha de próxima verificación (si aplica); mantener el historial en lugar de reemplazar números sin rastro.
9. Al cerrar una tarea, **actualizar solo la nota propietaria** y el índice si aparece un nuevo tema; evitar múltiples versiones de un mismo conocimiento.
10. **Conservar fuente y nivel de confianza:** [VIDEO] opinión, [ROBLOX] oficial, [RBLX-LAB] criterio/hipótesis, [POR VERIFICAR] falta de evidencia.

## Reglas que bloquean inversión

- Antes de desarrollar: **core fantasy clara + título + thumbnail + comprobación de demanda + core loop prototipable**. Si falla, NO-GO hasta corregir.
- Antes de escalar Ads: **primera acción comprensible, fun loop probado, telemetría confiable, FTUE, D1/tiempo de sesión y presupuesto máximo aprobado**. Si el juego no retiene, arreglar antes de comprar tráfico.
- La recomendación Tizzy de 16 créditos/día por 3 días es **una prueba sugerida**, no gasto obligatorio o mínimo impuesto por Roblox.
- Regla antigua 500 Highly Engaged Players **obsoleta como umbral actual**: bajó a 250 en agosto; Roblox anunció despliegue a 100 desde 19/11/2026. Revisar **Creator Hub → Publish Settings → Manage Audience** antes de actuar.
- No usar una IA con permiso de cambiar anuncios o recarga automática sin autorización humana por campaña y presupuesto.

## RBLX LAB — normas coexistentes

- Analytics-first: toda feature tiene hipótesis, KPI, denominador, evento validado en servidor, QA y fecha/versión.
- El público objetivo histórico de muchos proyectos es de aprox. **9–15 años**, pero comprobar el público de **cada juego**. Lenguaje legible, controls mobile-first, seguridad, monetización sin explotación de menores.
- Ideas pasadas pueden quedar superadas: revisar fecha y decisión vigente del proyecto antes de imponer un shooter, un tycoon o un loop previo.
- Repo de conocimiento **no es repo de juego**. No editar scripts de Roblox Studio solo por leer notas.
- Fuente de juegos externos para investigación: [GameIdeasForRoblox.md](GameIdeasForRoblox.md). No copiar personajes, niveles ni marcas protegidas.

## Cómo producir una respuesta breve y útil

- Para ideas: **Veredicto** (GO/RESEARCH/NO-GO) + evidencia externa + prueba Roblox + fantasy/título/thumbnail + riesgo #1 + siguiente test.
- Para campaña: **Gasto/Impresiones/Clicks/CTR/Plays/CPP/D1** + pérdida del funnel + **un cambio prioritario** + criterio de parada. Si no están los datos, no simularlos.
- Para dudas de factibilidad: **actualización oficial con fecha**, qué se sabe, qué falta comprobar en el panel y acción mínima.
- No repetir una explicación de 3.000 palabras si el usuario pidió una decisión puntual; dar link al archivo de detalle.

## Mantenimiento

- Archivos raíz: mapas y playbooks canónicos.
- Templates/: formatos reutilizables, sin métricas ficticias.
- Futuras campañas reales: Campaigns/<juego>/<YYYY-MM-DD>-<campaña>.md (crear solo cuando existan datos).
- Futuras ideas: conservar backlog en GameIdeasForRoblox.md o separar en Ideas/ solo cuando haya múltiples expedientes completos, actualizando links.
- Evidencia visual: en Obsidian local usar _Media/Roblox/; no inventar enlaces a PNG no sincronizados.
- Actualizar README si se agrega un tema o se mueve un archivo. Nunca borrar/mover notas antiguas sin actualizar backlinks.
