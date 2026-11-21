# Desarrollo Roblox con IA — playbook operativo

**Estado:** síntesis de referencia · **Fecha:** 2026-11-21 · **Fuente principal:** archivo aportado `reglas de creacion.md.txt`, transcripción en español del video **«Cómo crear juegos de Roblox con IA y ganar dinero (guía REAL)»**, duración aproximada 16 minutos. Esta guía **no es una transcripción literal**; sus notas con marca [VIDEO] resumen lo dicho en ese archivo. Las reglas [RBLX-LAB] son decisiones operativas del proyecto. Datos de pagos, tasas, elegibilidad y herramientas pueden cambiar; confirmar en Roblox Creator Hub antes de usar.

**Lectura rápida para IA:** diseño 1 página → prototipo gris 2–3 días → instrumentar analytics/servidor → probar con jugadores → decidir por D1 y sesión → solo entonces ads/escala. Ver [AI_CONTEXT.md](../AI_CONTEXT.md) para enrutamiento.

## 1. Filtro inicial — la IA no inventa demanda

**[VIDEO 06:43–07:55]** La IA acelera la construcción, pero no resuelve una idea que no engancha. Antes de programar, escribir **una sola página**: fantasía central, bucle, primeros cinco minutos, motivo para volver mañana. Referencia del video: «Caza Bugs» = atrapar bichos → vender → mejorar la red → buscar bichos nocturnos raros.

**[RBLX-LAB]** El juego no pasa a desarrollo amplio sin **core fantasy + demanda contrastada + título + thumbnail + core loop divertido**. Ver investigación y scorecard en [GameIdeasForRoblox.md](../GameIdeasForRoblox.md) y filtro comercial en [CampaingsAndPreGameCreation.md](../CampaingsAndPreGameCreation.md).

### Brief obligatorio para una IA

```text
GAME: [nombre provisional]
PLAYER FANTASY: Soy [rol]; hago [verbo]; siento/obtengo [resultado].
FIRST 10 SEC: [única acción comprensible; control móvil]
CORE LOOP: [acción → feedback → recompensa → repetir]
FIRST 5 MIN: [primera recompensa, mejora y segundo loop]
RETURN REASON: [por qué volver mañana]
TITLE/THUMBNAIL: [promesa comprobable visualmente]
DIFFERENTIATION: [qué NO copio del competidor]
TARGET / DEVICES: [edad objetivo, móvil/PC/consola]
METRICS: [D1, tiempo de sesión, FTUE, replay]
SHIP GATE: [condición observable antes de gastar dinero]
```

## 2. Herramientas y límites [VIDEO 05:31–06:43]

- **Roblox Studio + Assistant:** empezar con tareas pequeñas; inspeccionar cada script. Capacidades y límites dependen de disponibilidad actual.
- **MCP Roblox Studio con Claude, Codex u otras IAs:** solo conectar clientes de confianza; un conector con escritura puede modificar todo el juego. Verificar conexión real y permisos antes de afirmar acceso.
- **Rojo + Git:** conservar scripts versionados, registrar cambio pequeño por commit, recuperar ante regresiones. Si el proyecto no usa Rojo, describir esa limitación.
- **Config central:** valores numéricos, cooldowns, precios y otros parámetros en un solo lugar; no distribuir cifras mágicas en scripts.
- No instalar plugins desconocidos o sin inspección de permisos.

## 3. Método de desarrollo incremental

**[VIDEO 07:55–09:13]** Prototipo feo pero jugable en **2–3 días** (aspiración del autor, no garantía); trabajar **pedir → probar → corregir**, nunca «hacé el juego entero». El video describe errores típicos de IA en 3D: alturas, rangos de alcance, modelos movidos/nombres que no coinciden.

**[RBLX-LAB] Plan de tareas por bloque:**
1. **Core:** mapa pequeño, única mecánica que ya produce diversión, configuración, controles móvil, modo de 1 jugador o baja concurrencia y seguridad en servidor.
2. **Analytics:** registrar FTUE, primera recompensa, primer loop completo y replay con **validación en servidor**; comprobar eventos sin duplicados. D1/D7 vienen del dashboard oficial.
3. **Depth / social:** añadir solo si mejora una hipótesis concreta (por ejemplo, % de segunda ronda o duración), sin llenar el juego de sistemas.
4. **Persistencia + monetización honesta:** validar DataStore, reintentos, receipts idempotentes, productos diferenciados, QA; no ventaja paga abusiva.
5. **Lanzamiento pequeño y actualizaciones:** probar con nuevos jugadores, observar dónde se confunden, corregir y medir la versión nueva.

### Prompt mínimo para cada cambio

```text
Lee solo los archivos relevantes al cambio. Objetivo: [una tarea].
Describe hipótesis, KPI y eventos antes de editar.
No cambies sistemas ajenos. Servidor autoritativo: valida remotos y economía.
Centraliza constantes en Config y no inventes IDs.
Implementa el cambio mínimo; enumera archivos tocados.
Prueba en Studio (si hay acceso real) o especifica pruebas manuales reproducibles.
Reporta: HECHO / PARCIAL / BLOQUEADO + evidencia/log + riesgos + siguiente paso.
No declares que algo fue probado si no se ejecutó.
```

## 4. Seguridad, dinero y menores

**[VIDEO 09:13–09:34]** «El servidor decide»: cliente no determina ganancias, artículos comprados, inventario, resultados o premios. Validar inputs, distancia, cooldown, rate limits y ownership server-side.

**[VIDEO 10:47–11:44]** Diferenciar Game Pass (compra única) y Developer Product (repetible). Transparencia sobre probabilidades de items aleatorios; verificar reglas actuales de Roblox. Evitar pay-to-win dominante y presiones dirigidas a menores.

**[RBLX-LAB]** Antes de habilitar compras: QA de recibos duplicados/retries, persistencia, reconexión, multi-cliente, mobile, límites de remotos. No pedir a una IA que «complete el paso de cobrar» sin configurar ids reales y autorizaciones.

## 5. Lanzar, medir y decidir por retención

**[VIDEO 12:06–15:56]** Observar a varios amigos/jugadores sin explicarles el juego; donde no entienden aparece la próxima tarea. Publicar pequeño, revisar analíticas y actualizar. **Retención del día 1 (D1)** y duración de sesión importan antes de invertir en anuncios: «si casi nadie vuelve, no pagues publicidad: cambia el juego». La referencia a «primeros 28 días» en el video es una afirmación de esa fuente; no asumirla como regla estable sin revisar docs actuales.

**[RBLX-LAB] Puertas:**
- **No lanzar** sin core loop y FTUE claros, errores críticos resueltos, seguridad y guardado verificados.
- **No escalar anuncios** si D1/tiempo de sesión son insuficientes frente a comparables, sin saber por qué; primero corregir.
- **No afirmar rendimiento** sin fecha, cohorte, dispositivo y ventana.
- **No confundir CTR de anuncios con Home recommendation PTR/QPTR**. Usar [plantilla de campañas](../Templates/CampaignReviewTemplate.md).

## 6. Formato de trabajo y evidencia para IAs

Cada entrega:
- **Tarea y razón:** hipótesis, versión y KPI.
- **Acciones verificadas:** archivo/objeto/script realmente modificado, log o prueba realizada.
- **Riesgos:** bugs visuales 3D, seguridad cliente-servidor, rendimiento móvil, DataStore, compras duplicadas.
- **Estado:** `COMPLETADO` / `PARCIAL` / `BLOQUEADO`; no describir «todo listo» si falta probar.
- **Próxima decisión:** una prioridad, su coste/beneficio y criterio de aceptación.

**Presupuesto de tokens:** no releer notas de marketing para corregir un bug de código. No repetir búsquedas de ideas si ya hay fuentes en el vault. Guardar aprendizajes concretos con fecha y fuente en la nota propietaria.

## 7. Marca temporal de la fuente (referencias rápidas)

| Timestamp | Tema del archivo aportado |
|---|---|
| 05:31–06:43 | Studio/Assistant/MCP/Git/Rojo y confianza en conectores |
| 07:36–08:24 | Diseño en una página, prototipo gris, tareas pequeñas |
| 08:50–09:34 | Problemas 3D, Config, servidor autoritativo |
| 10:47–11:44 | Arte, pases, productos, trato a menores |
| 12:06–13:21 | Prueba con amigos, lanzamiento pequeño, updates |
| 15:02–15:56 | Errores frecuentes, D1 y sesión antes de publicidad |

**No confundir:** cifras de DevEx, Creator Rewards, tasas o audiencias relatadas en este video son *datos de la fuente*, no tarifas vigentes verificadas. Consultar documentación oficial antes de cálculos financieros o anuncios.
