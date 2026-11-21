# AGENTS.md — Roblox Vault (instrucciones mínimas para cualquier IA)

> **Repositorio de CONOCIMIENTO** RBLX LAB; NO es el código de los juegos. Objetivo: decisiones basadas en fuentes, **mínimo de tokens y búsquedas**. Idioma de respuesta: el del usuario.

## 0. Protocolo de lectura: progressive disclosure

1. **Lee este índice, no todo el repositorio.** Para una consulta sencilla, responde sin abrir otros documentos si basta este contexto.
2. Si la pregunta abarca varias áreas, leer **[AI_CONTEXT.md](AI_CONTEXT.md)** (resumen de una página). Si trata un tema puntual, **saltar ese resumen** e ir directo a la sección indicada abajo.
3. Abrir **solo los encabezados/rangos pertinentes** del documento propietario; expandir únicamente cuando falta un dato. No cargar los 24 KB de ideas ni los 20 KB de Ads para una pregunta de una línea.
4. Buscar web o Creator Hub **solo** si se necesitan cifras cambiantes, anuncios vigentes, regulación, o confirmar una laguna factual. Reutilizar URLs/fechas del vault; no repetir scraping del video.
5. Una afirmación sin evidencia lleva `UNKNOWN`, no un número inventado. No dar acceso Studio/GitHub/Ads por hecho sin comprobarlo.

## 1. Rutas deterministas por intención

| Consulta | Documento propietario y secciones iniciales |
|---|---|
| Crear/validar idea, ranking, mercado Flash, competencia | [GameIdeasForRoblox.md](GameIdeasForRoblox.md) §1, §3–4, §7–8 |
| Core fantasy, demanda de palabras, nombres, miniaturas | [CampaingsAndPreGameCreation.md](CampaingsAndPreGameCreation.md) §1–2 |
| Lanzar Sponsored Ads, créditos, elegibilidad Kids and Select | [CampaingsAndPreGameCreation.md](CampaingsAndPreGameCreation.md) §3 |
| Evaluar campaña, CTR, CPP, ROAS, D1, Home | [CampaingsAndPreGameCreation.md](CampaingsAndPreGameCreation.md) §4–5 + [CampaignReviewTemplate.md](Templates/CampaignReviewTemplate.md) |
| Programar con IA/Studio/MCP, QA, seguridad y releases | [Playbooks/AI-GameDevelopment.md](Playbooks/AI-GameDevelopment.md) §1–6 |
| Recordar decisiones o candidatos estudiados | [GameIdeasForRoblox.md](GameIdeasForRoblox.md) §5, §8, historial |
| Visión general o problema entre varias áreas | [AI_CONTEXT.md](AI_CONTEXT.md), luego solo lo faltante |

## 2. Gates (no omitir)

- **Antes de crear:** core fantasy + prueba de demanda + título + thumbnail + bucle divertido; si falla, `RESEARCH/NO-GO`.
- **Antes de Ads:** experiencia jugable para niños y móvil, telemetría y retención verificadas, techo de gasto aprobado. Si la gente abandona/no vuelve, arreglar antes de aumentar publicidad.
- **Antes de compras/código:** servidor autoritativo para premios y economía, remotos validados, receipts idempotentes, QA. Ningún script instalado sin inspección.
- **Cada feature** tiene hipótesis, KPI/denominador, evento servidor, segmento, versión y prueba. No forzar funnels que no siguen secuencia real.
- **No gastar, editar campañas, ni publicar** sin autorización explícita y permisos comprobados. Una nota en el vault no autoriza cambios en juegos ajenos.

## 3. Interpretación y actualidad

- `CTR Ads = clicks / ad impressions`; **NO** es `PTR/QPTR Home`. `CPP = spent / attributed plays` cuando el panel permite esa comparación.
- D1/D7 y duración de sesión: consultar cohortes del panel, nunca calcular de contadores no equivalentes.
- Tizzy mostró **CTR 1,54 % → 3,27 %** para un caso; **16 créditos/día × 3 días** es su ejemplo, **no benchmark ni mínimo oficial**.
- Requisito antiguo **500 Highly Engaged Players** quedó desactualizado: Roblox anunció 250 (agosto) y despliegue de 100 desde 19/11/2026. **Comprobar requisito en Creator Hub de cada juego** antes de actuar.
- **Fuentes en orden:** datos propios recientes → Roblox oficial fechado → vault con fuentes → video de creador → hipótesis. Marcar `[VIDEO]`, `[ROBLOX]`, `[RBLX-LAB]` y fecha donde importe.

## 4. Respuestas cortas y actualización del vault

- **Ideas:** `GO/RESEARCH/NO-GO` + 2–3 evidencias + fantasía/título/thumbnail + riesgo y próximo test.
- **Ads:** período, moneda, gasto, impresiones, clicks, CTR, plays, CPP, D1, sesión, principal cuello de botella, **un cambio** y criterio de pausa. Si no hay métricas, `INCONCLUSO` + campos mínimos faltantes.
- **Código:** archivos tocados, cambio mínimo, KPI/evento, QA verificado y `COMPLETADO/PARCIAL/BLOQUEADO`.
- Actualizar solo **nota propietaria** con URL, fecha y evidencia, no crear múltiples resúmenes iguales. Guardar capturas solo si el binario existe; nada de links rotos. Registrar campañas reales en `Campaigns/<juego>/<fecha>-<campaña>.md` solo cuando haya datos.
- No borrar/mover archivos existentes ni duplicar investigaciones sin comprobar enlaces.
