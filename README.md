# Roblox Vault — RBLX LAB

**Repositorio de conocimiento, no código de juegos.** Investigación, diseño, desarrollo con IA y publicidad Roblox. **Última reorganización:** 2026-11-21.

## Para IAs: leer por intención, no todo

- **[AGENTS.md](AGENTS.md)** — *primera lectura recomendada* para Claude, Codex, Cursor y Copilot: mapa mínimo por tarea, límites de gasto, evidencia, seguridad y ahorro de tokens.
- **[AI_CONTEXT.md](AI_CONTEXT.md)** — resumen ejecutivo de una página **solo cuando la pregunta combina áreas**. No es necesario para consultas puntuales.
- **[CLAUDE.md](CLAUDE.md)** y **[.github/copilot-instructions.md](.github/copilot-instructions.md)** — entradas ligeras nativas para sus asistentes.
- **[.cursor/rules/roblox-vault.mdc](.cursor/rules/roblox-vault.mdc)** — entrada de Cursor.

## Índice de fuentes canónicas

| Necesito... | Ir a... |
|---|---|
| Encontrar/validar ideas, Flash, 3M visitas, ratings, Roblox gap | **[GameIdeasForRoblox.md](GameIdeasForRoblox.md)** |
| Decidir core fantasy, título, miniatura y keyword demand | **[CampaingsAndPreGameCreation.md](CampaingsAndPreGameCreation.md)** §1–2 |
| Configurar/interpretar Roblox Sponsored Ads, CTR, CPP, D1, Home | **[CampaingsAndPreGameCreation.md](CampaingsAndPreGameCreation.md)** §3–5 |
| Analizar datos reales de una campaña | **[Templates/CampaignReviewTemplate.md](Templates/CampaignReviewTemplate.md)** |
| Desarrollar con Roblox Studio, MCP, Claude/Codex, Git, seguridad, QA | **[Playbooks/AI-GameDevelopment.md](Playbooks/AI-GameDevelopment.md)** |

## Norma esencial

1. **No desarrollar a escala:** sin fantasía clara, título, miniatura, evidencia de demanda y loop divertido.
2. **No escalar publicidad:** si faltan onboarding, retención D1/tiempo de sesión y datos fiables.
3. **No inventar resultados:** diferenciar evidencias de un video, números del propio juego, fuentes oficiales e hipótesis.
4. **No gastar créditos ni tocar campañas** sin autorización explícita.

## Fuentes

- [Tizzy — Roblox Sponsored Ads Explained](https://www.youtube.com/watch?v=owMnhg3fn_M) · [transcripción](https://prepublish.ai/youtube-transcript/owMnhg3fn_M)
- [Tizzy — Cómo encuentra ideas de Roblox](https://www.youtube.com/watch?v=8q6kdFVL_fY)
- Documento del usuario: `reglas de creacion.md.txt`, transcripción «Cómo crear juegos de Roblox con IA y ganar dinero (guía REAL)», resumido en el playbook de desarrollo.
- [Roblox Ads Manager oficial](https://create.roblox.com/docs/production/promotion/ads-manager) · [Roblox Discovery](https://create.roblox.com/docs/discovery)

**Dato sensible a fecha:** no usar 500 Highly Engaged Players como regla universal. Roblox anunció bajar primero a 250 y luego iniciar despliegue a 100 desde 19/11/2026. Confirmar requisito actual en Creator Hub. [Comunicado](https://devforum.roblox.com/t/highly-engaged-player-threshold-drops-to-250/4820164).

## Convenciones de mantenimiento

- `Templates/`: ejemplos, sin datos reales inventados.
- `Playbooks/`: implementación por disciplina.
- `Campaigns/`: crear un archivo por juego/campaña/fecha **solo** cuando haya métricas.
- `_Media/Roblox/` (Obsidian local): capturas verificadas; no insertar embeds a archivos ausentes.

El **nombre histórico** `CampaingsAndPreGameCreation.md` se conserva para no romper enlaces.
