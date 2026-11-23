---
title: "RBLX LAB — Catálogo compartido UI, VFX, voxel, tiendas y Claude Code"
updated: 2026-11-23
status: reusable-toolchain-approved-for-audit-not-installed
tags: [roblox, claude-code, ui, shop, gamepasses, voxel, vfx, sfx, superpowers]
---

# Herramientas compartidas para TODOS los proyectos Roblox

**Decisión permanente del propietario (23/11/2026):** consultar este catálogo cuando cualquier juego Roblox necesite UI, HUD, botones, animación, tiendas con moneda de juego, Robux, efectos, texto, sonido, tutoriales, modelado voxel o mapas. **No significa instalar todo en cada proyecto.** Se aplican [AGENTS.md](../AGENTS.md), [Superpowers](Superpowers-Methodology-Roblox-AI.md), [producción visual](Roblox-Visual-Production-UGC-UI-3D-AI.md) y la directiva vigente del juego. GPT/Claude deben usar lectura progresiva y ahorrar créditos.

## Catálogo de herramientas GitHub (repositorios existentes verificados; licencias y compatibilidad POR AUDITAR por versión)

| Uso | Repositorio | Tratamiento |
|---|---|---|
| Kits UI .rbxm, tienda, HUD, menús | https://github.com/EvannT-acc/roblox-ui-kits | Inspeccionar assets, scripts y licencias; prototipos |
| Referencias de UI/audio visual | https://github.com/isaiahagi/roblox-ai | Inspiración/archivo de referencias; derechos por asset |
| Editor visual y MCP UI | https://github.com/MarkRuiz00/RbxUiStudio | Evaluar en sandbox, no confiar permisos por defecto |
| Sistema modular HUD/shops | https://github.com/rblx-peak/rblx_ui | Comparar arquitectura; no superponer otros frameworks |
| Estilo Stud, iconos | https://github.com/TemporaryLooker22/Stud-UI-Clean-Roblox | Revisar licencias de iconos/UI |
| Tweens/UI | https://github.com/leo-prad/Twinkle | Escoger una solución de animación |
| Hover/click FX | https://github.com/ZyCrypticz/HoverFX | No importar scripts sin auditar |
| Barra topbar | https://github.com/1ForeverHD/TopbarPlus | Integrar sólo si mejora accesibilidad móvil |
| Previsualización GUI | https://github.com/PepeElToro41/ui-labs | QA visual y componentes en aislamiento |
| Reactividad Luau | https://github.com/dphfox/Fusion | Sólo si repo usa o necesita estado reactivo |
| Skill voxel IA | https://github.com/Festus26/voxel-modeling-agent-skill | Auditar instrucciones y calidad |
| Edición/automatización voxel | https://github.com/theromis/Froxel | Validar servidor MCP y export real |
| Modelado Blender MCP | https://github.com/ahujasid/mcp-for-blender | Conexión explícita, Blender local, permisos |
| Agente Studio oficial | https://github.com/Roblox/roblox-studio-agent-plugin | Inspeccionar setup y probar Studio LIVE vs documento |
| World-building Roblox | https://github.com/benigeci/roblox-world-builder | Biomas/escenas, no motores de física innecesarios |
| Convertir/optimizar voxel | https://github.com/Maicarons/voxel-tool | Validar voxel source, GLB/FBX, rendimiento |
| Metodología Superpowers | https://github.com/obra/superpowers | Skill/patrón de ejecución de tareas, no assets |
 
**Fuentes Roblox oficiales:** 
- https://create.roblox.com/docs/tutorials/use-case-tutorials/ui/interactive-ui
- https://create.roblox.com/docs/production/monetization/passes
- https://create.roblox.com/docs/production/monetization/developer-products
- https://create.roblox.com/docs/ui/animation
- https://create.roblox.com/docs/ui/rich-text
- https://create.roblox.com/docs/tutorials/use-case-tutorials/audio/add-2D-audio
- https://create.roblox.com/docs/production/game-design/onboarding-techniques

## Instalación y validación con Claude Code (máquina del usuario)

1. Abrir la carpeta correcta del repo de juego en Claude Code, verificar `git status`, `git remote -v`, HEAD, `CLAUDE.md`, `AGENTS.md` y el Vault. Respetar las decisiones recientes.
2. En Claude Code instalar **Superpowers** (si falta), en su interfaz de comandos: `/plugin install superpowers@claude-plugins-official`. Alternativa: `/plugin marketplace add obra/superpowers-marketplace` y `/plugin install superpowers@superpowers-marketplace`. Reiniciar sesión y probar skills `using-superpowers`, `writing-plans`, `systematic-debugging`, `test-driven-development`, `verification-before-completion`. **Estas notas no instalan el plugin local**.
3. Verificar `/mcp` y acceso de Claude a Roblox Studio; configurar agente de Studio **sólo siguiendo su README vigente**, sin secretos en Git. Comprobar Rojo/Git y que el editor abierto sea el Place correcto antes de tocar Studio.
4. Para cada repo de terceros: fijar URL, licencia, release/commit, método de instalación, dependencias, privilegios MCP, código y ownership de assets; comparar con herramientas ya instaladas. No `curl | bash`, no ejecución ciega de scripts y no instalar paquetes duplicados. Guardar decisión `ADOPT/REFERENCE/REJECT` en manifest.
5. En rama aislada cuando corresponda, importar UN botón/ventana o UN asset de prueba, correr tests y QA desktop/touch, inspeccionar Mobile Emulator vs dispositivo real; revisar latencia, memory, sonido mute, permisos. Deshabilitar experimentos por feature flag.
6. Usar tokens de estilo globales y componentes reutilizables Luau; código fuente editable y capturas auténticas. NO pegar una imagen que aparente UI funcional. Los assets binarios .rbxm/.blend/.vox/.glb no se crean por escribir Markdown.
7. Un `ProcessReceipt` idempotente para developer products, `UserOwnsGamePassAsync` para pases, DataStore y STOMPAS server-authoritative; probar fallo/duplicado y derechos históricos. Comprar Robux siempre es opcional y explícito. No inventar ProductIds.
8. Mantener una sola fuente en este playbook compartido; en cada proyecto hacer sólo una ficha de aplicación y un manifest de herramientas adoptadas. No sincronizar repositorios ciegamente ni publicar/activar pagos.

## Estándar mínimo UI para Roblox

- Componente `AnimatedButton` con hover/tap/pressed/disabled, rebote moderado, SFX corto licenciable, feedback accesible; `ShopCard` con precio preciso STOMPAS o Robux, `CurrencyCounter`, `Popup`, `Toast`, `TutorialHint`, `RewardFX`.
- `ScreenGui`, `UIScale`, `UIAspectRatioConstraint`, `UITextSizeConstraint`, safe area, landscape/touch y navegación gamepad; CTA principal siempre más claro que secundarios.
- Lenguaje de lectura 3.º/4.º grado, texto breve, alto contraste, RichText moderado; nada tapando gameplay, controles y telegraphs. Un modal como máximo para primera tarea.
- Arte: voxel 3D real + fuente editable + al menos vistas frontal/lateral/trasera/superior/3-4 y escala real en Studio; tier por silueta, no sólo color; LOD/performance móvil.

## Enrutamiento

- STOMPIES: [directiva de ejecución D10-D/D11 + UI + 50 concepts](https://github.com/ortizfram/STOMPIES_VAULT_OBSIDIAN_GPT_CLAUDE_V1/blob/main/07_AGENTES/PROMPT_CLAUDE_D10_D11_UI_VOXEL_COMMERCE_2026_11_23.md). D10 conserva rescate directo y no huevos.
- Defend the Pizza, Space Fishing y proyectos futuros: leer su directiva vigente y adaptar componentes, NO copiar mecánicas STOMPIES.
- Cada sesión: `READ → PLAN (Superpowers) → RED/GREEN → QA → REVIEW → COMMIT → VAULT`. Diferenciar documentación de código en Git, Studio guardado y publicado.
