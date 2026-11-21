# RBLX LAB — Contexto rápido para IAs (v2 · 2026-11-21)

> **Propósito:** responder preguntas frecuentes y decidir qué consultar **sin cargar 20–40 KB de guías**. Instrucciones operativas en [AGENTS.md](AGENTS.md). Las fuentes detalladas prevalecen frente a este resumen.

## Decisiones estables del proyecto

- **Antes de construir:** comprobar **core fantasy (promesa emocional), título, thumbnail, demanda y core loop divertido**. Si no se entiende la promesa en segundos, investigar/cambiar; todavía no desarrollar a escala.
- **Antes de comprar tráfico:** prototipo probado con gente nueva, primera acción legible, recompensa temprana, métricas reales de onboarding, sesión y retención D1; presupuesto máximo aprobado. Si nadie vuelve, mejorar el juego antes de escalar.
- **Analytics-first:** cada feature tiene hipótesis, KPI con denominador, evento validado por servidor, QA, segmento, versión y criterio de decisión. D1/D7 salen del panel nativo; los funnels deben reflejar secuencias reales.
- **IA de desarrollo:** tareas pequeñas + Git/Rojo cuando corresponda + Roblox Studio/MCP solo con permisos comprobados; servidor autoritativo en moneda/compras/recompensas; probar en Studio y con jugadores.
- **No equiparar** CTR de Sponsored Ads con PTR/QPTR de Home. No confundir clicks, plays, jugadores únicos, ingresos atribuidos o períodos de atribución.
- **No inventar** métricas, capturas, niveles lectores, ID de gamepass ni rentabilidad. Estado `UNKNOWN` cuando falta evidencia.
- **No cambiar campañas ni gastar créditos sin aprobación humana explícita.** Esta aprobación debe incluir monto/tope y alcance.

## Ruta mínima: una intención → una fuente

| Intención | Leer solo esta parte inicialmente |
|---|---|
| Juego nuevo, evaluar idea, demanda fuera de Roblox, scorecard | [GameIdeasForRoblox.md](GameIdeasForRoblox.md) §1, §3–4, §7–8 |
| Fantasía, keyword, título, thumbnail, lectura para niños | [CampaingsAndPreGameCreation.md](CampaingsAndPreGameCreation.md) §1–2 |
| Publicidad: configuración, mínimos sugeridos, Kids and Select | [CampaingsAndPreGameCreation.md](CampaingsAndPreGameCreation.md) §3 |
| Diagnóstico de campaña, CTR, CPP, D1, ROAS, Home | [CampaingsAndPreGameCreation.md](CampaingsAndPreGameCreation.md) §4–5 + [plantilla](Templates/CampaignReviewTemplate.md) |
| Construcción con Roblox Studio, Claude/Codex, MCP, Git, QA | [Playbooks/AI-GameDevelopment.md](Playbooks/AI-GameDevelopment.md) |
| Qué se investigó previamente | [GameIdeasForRoblox.md](GameIdeasForRoblox.md) §5 y §8 |
| Datos específicos de una campaña | Solo la nota `Campaigns/<juego>/<fecha>-<campaña>.md` **si existe**; no inventar esa ruta |

## Números de contexto: NO son objetivos universales

- **Video Tizzy (mayo 2026):** ejemplo de CTR **1,54 % → 3,27 %** tras trabajar nombre y creatividades; no es prueba aislada de causa ni benchmark general.
- **Video Tizzy:** propone **16 ad credits/día × 3 días** como ejemplo de test; no es requisito obligatorio de Roblox.
- **Highly Engaged Players para Kids and Select:** video antiguo mencionó 500; Roblox anunció **250** en agosto y comenzó a desplegar un descenso a **100** desde 19/11/2026. Comprobar el requisito vigente **para ese juego** en Creator Hub antes de cualquier recomendación.
- **Fuente externa:** Creator Exchange puede servir para validar señales de visitas y palabras; sus ingresos son estimaciones. Comprobar fecha, títulos alternativos y competidores directos.

## Salida eficiente

**Ideas:** `GO / RESEARCH / NO-GO` + evidencia y fecha + fantasy/título/thumbnail + primer test.

**Campañas:** período y moneda + impressions/clicks/CTR/plays/CPP + D1, duración, first-session bounce + hipótesis principal + **un cambio** + condición de pausa. Sin datos, entregar `INCONCLUSO` y las métricas mínimas faltantes.

**Desarrollo:** cambio acotado + archivos modificados + evento/KPI + prueba Studio/servidor + bloqueo o evidencia.

## Jerarquía y actualización

1. Capturas, logs y exports **actuales** del juego.
2. Roblox Creator Hub oficial **fechado** para reglas cambiantes.
3. Notas canónicas del vault con URL/fecha.
4. Videos y ejemplos de creadores **como evidencia anecdótica**.
5. Hipótesis de la IA, siempre etiquetadas.

**Regla de ahorro:** responde con lo que ya está documentado; revisa web solo si la decisión depende de datos actuales o hay evidencia incompleta. No volver a bajar videos ni reabrir todo el vault por defecto.
