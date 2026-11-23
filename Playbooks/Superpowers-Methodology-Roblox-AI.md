---
title: "Superpowers para Roblox Vault — protocolo de prompts y desarrollo"
source: "https://github.com/obra/superpowers"
upstream_commit_checked: "22f0b463e7a5e579904dd6211a520321035526f7"
updated: 2026-11-23
status: active_guidance
tags: [roblox, ia, claude-code, superpowers, testing, credits]
---

> **Uso activo STOMPIES — 23/11/2026:** el ejemplo actual de aplicación es [D10-D Arena + D11 personalidad Titan, 5 biomas, STOMPAS + cosméticos](../Projects/Stompies/D10-D11-Superpowers-Arena-Giant-Economy-2026-11-23.md). Mantener esta metodología en **todos** los prompts siguientes; no confundir sincronización documental con instalación local del plugin de obra/superpowers.

# Superpowers — metodología para todos los próximos prompts de Roblox

**Preferencia vigente del dueño (23/11/2026):** incorporar [obra/superpowers](https://github.com/obra/superpowers) al flujo de prompts y trabajos de Roblox. Este Vault conserva un **puente documental**; el plugin real se instala en el Claude Code del usuario, no por escribir este archivo. No afirmar que está instalado, que los skills se ejecutaron o que existe sincronización automática del repositorio upstream.

**Fuente upstream leída:** README y skills del commit `22f0b463e7a5e579904dd6211a520321035526f7` (v7.0.2). Licencia MIT; este documento resume y adapta el flujo, **no copia ni vendorea** el código ni los archivos upstream. Verificar instrucciones recientes del README en futuras instalaciones, porque `main` puede cambiar.

## Instalación en Claude Code (máquina del usuario)

En Claude Code, ejecutar el comando oficial del marketplace:

```text
/plugin install superpowers@claude-plugins-official
```

Si se instala desde el marketplace de Superpowers, seguir la alternativa oficial del [README](https://github.com/obra/superpowers#installation). Verificar desde una **nueva sesión** que las skills estén disponibles; no duplicar manualmente habilidades preexistentes. `git clone` solo descarga archivos: **no instala el plugin** automáticamente. La instalación es local por harness, no una acción que puedan efectuar estas notas de GitHub.

## Protocolo de trabajo para futuros prompts

1. **Base real:** el agente identifica proyecto/repo/Studio Place correcto, `git status`, HEAD y último handoff; lee sólo las secciones relevantes. Diferencia SPEC / GIT / STUDIO GUARDADO / PUBLICADO / QA.
2. **Skills relevantes:** si el plugin está instalado, invocar `using-superpowers` y la skill aplicable. `brainstorming` al abrir una decisión de diseño; para una directiva ya aprobada no reabrirla por costumbre, confirmar alcance y plan. `systematic-debugging` para defectos antes de parchear.
3. **Plan implementable:** `writing-plans`, con archivos exactos, pruebas, riesgos, rollback y unidades pequeñas. Ubicar plan en docs del proyecto, por ejemplo `DOCS/SUPERPOWERS_PLANS/`; no ocultar decisiones.
4. **Aislamiento:** `using-git-worktrees` cuando el flujo Git admita un workspace aislado, pero **no duplicar editores** del mismo Roblox Studio LIVE. Claude mantiene el Studio único de STOMPIES y comprueba hashes antes de aplicar cambios; tests de Luau fuera de Studio si es posible.
5. **Red → Green → Refactor:** `test-driven-development` con prueba que falla antes del código, implementación mínima, prueba que pasa, regresiones y commit atómico. Para GUI/Studio, usar harness seguro, casos de reproducción, y QA real; no inventar test runner ni afirmar TDD si no hubo test rojo.
6. **Ejecución consciente de créditos:** `executing-plans` **inline** por defecto en tareas acotadas; `subagent-driven-development` sólo cuando el coste añadido compensa complejidad/riesgo; revisión final `requesting-code-review` y `verification-before-completion`. No abrir agentes redundantes, no leer todo el vault ni volver a ejecutar pruebas sin hipótesis.
7. **Evidencia final:** HECHO / PROBADO PC / PROBADO MÓVIL FÍSICO / DOS CLIENTES / PENDIENTE / PUBLICADO; capturas auténticas, logs, hashes, versión, riesgos, fallos, decisión GO/ITERAR. Ninguna afirmación de completitud sin evidencia fresca.
8. **Seguridad:** ningún lanzamiento, monetización, gasto Robux, modificación de campañas, migración destructiva ni cambios sobre compras antiguas sin consentimiento explícito y revisión; DataStore/receipts/server authority intactos.
9. **Fuente de verdad:** decisión vigente del dueño + directiva aprobada del proyecto > handoff/QA real Studio > export de código > notas históricas. Superpowers mejora **cómo se trabaja**, no decide el diseño ni sustituye la política de ahorro de créditos.

## Adaptación a distintos proyectos

- STOMPIES: ver [protocolo específico](https://github.com/ortizfram/STOMPIES_VAULT_OBSIDIAN_GPT_CLAUDE_V1/blob/main/07_AGENTES/SUPERPOWERS_PROTOCOLO_CLAUDE_ROBLOX_2026_11_23.md) y la Directiva D10.
- Defend the Pizza: además cumplir `AGENTS.md` + `docs/WORK_CREDIT_EFFICIENCY.md` del juego; no tocar Studio concurrentemente.
- Nuevos proyectos: primero validar demanda + core fantasy + título/thumbnail + loop con [CampaingsAndPreGameCreation.md](../CampaingsAndPreGameCreation.md) y [GameIdeasForRoblox.md](../GameIdeasForRoblox.md), después planificación/implementación.

## Plantilla corta para encabezar futuros prompts

> **PROTOCOLO RBLX + SUPERPOWERS (obligatorio):** ver `roblox-vault/Playbooks/Superpowers-Methodology-Roblox-AI.md`. Verificá si el plugin oficial `superpowers` está instalado en Claude Code y usá las skills pertinentes (diseño/plan, TDD, diagnóstico, revisión, evidencia). Respetá `AGENTS.md`, ahorro de créditos, Studio único y decisiones actuales. Ejecutá solo el bloque solicitado, reportá versionado/QA auténticos; no publicás ni gastás Robux sin autorización.
