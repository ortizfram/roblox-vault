---
title: "Roblox world building — escala macro con roblox-world-builder + WorldKit"
date: 2026-11-25
tags: [roblox, world-building, mapas, lobby, runner, voxel, claude-code, skill]
---

# Mejorar un mapa de Roblox: la escala que casi siempre falta

**Herramienta usada (y guardada para todos los proyectos):** skill de Claude Code
[`benigeci/roblox-world-builder`](https://github.com/benigeci/roblox-world-builder).

| Dato | Valor |
|---|---|
| Qué es | Un solo `SKILL.md` de método para diseñar y construir mapas. Sin código, sin assets, sin llamadas de red. |
| Licencia | MIT (Copyright (c) 2026 Udvari Dániel László) |
| Versión auditada | commit `301b66d510cf08cd5ebc5e4dfcc0764a88663818` (21/10/2026) |
| sha256 de SKILL.md | `6699eb1560c9092d6acdba3deb910a28ebdf5ce5457fd81bcb0fd4250dd4b20d` |
| Auditoría | Leído completo antes de instalar. No pide credenciales ni subidas. Nombra otras skills (`world-builder`, `scene-architect`, `roblox-gui`) que pueden no estar instaladas: ignorarlas. |

## Instalar en un proyecto
1. Descargar `SKILL.md` y `LICENSE` de ese commit a una carpeta aislada y leerlo entero.
2. Comprobar el sha256. Si cambió, volver a auditar.
3. Copiar a `.claude/skills/roblox-world-builder/` y anotarlo en el registro de skills de terceros del proyecto.
4. No sobrescribir skills existentes.

## El método en una página
- **Tres escalas, en este orden:** macro (50–300+ studs, lo que se lee de lejos), meso (10–40, da forma a los espacios),
  micro (menos de 8, el detalle). Nunca arreglar un mapa vacío sembrando cientos de props chicos.
- **Diseñar el lugar antes que los objetos:** qué se ve desde el spawn, por dónde se mueve el jugador, hitos para orientarse.
- **Juzgar desde la cámara del jugador** a tres distancias: lejos (silueta), distancia de juego, de cerca.
- **Antes de tocar un mapa que ya existe:** buscar qué scripts dependen de qué objetos, respaldar, no borrar nada jugable.
- **Informar con honestidad:** qué se construyó, qué se verificó y cómo, qué quedó sin verificar.

## Cómo se aplicó en SAVE RARE ANIMALS! (25/11/2026)
Diagnóstico: el lobby y la carrera tenían escala media y chica (props de borde, cercados, plaza) pero **ninguna macro**:
el lobby flotaba en un vacío azul y el horizonte de la carrera estaba vacío.
- Lobby: 9 formaciones de roca escalonadas fuera de la muralla (155 piezas, sin colisiones), alturas 47–117 studs,
  nunca equidistantes, con un sector libre para que el gigante siga siendo el protagonista.
- Carrera (runner): un hito del bioma cada 170–260 studs, a 72–118 studs del camino, lados alternados.
- Código reutilizable: [`Templates/Roblox-WorldKit-MicroVoxel-Landmarks.luau`](../Templates/Roblox-WorldKit-MicroVoxel-Landmarks.luau)
  (origen: `STOMPIES_GAME/SOURCE/LUAU/ReplicatedStorage/GiantStomp/WorldKit.luau`, con su test `WorldKitTest`).

## Patrón WorldKit (para copiar en otro juego)
- Geometría **propia**: cada hito son cajas colocadas por código desde una semilla. Nada de modelos de terceros.
- **Tope duro de piezas por hito** (44) y todo anclado, sin colisión, sin toque, sin consulta; las piezas chicas sin sombra.
- **Misma semilla = mismo hito** (se puede testear y reconstruir).
- Composición en anillo (`ring`): radios mínimo / máximo, separación angular mínima, un sector abierto, y alturas con
  ritmo (uno alto cada tres), no una cerca pareja.
- En contenido generado en vivo (runner): **azar propio** para el decorado, así ningún sorteo del juego se mueve; el
  decorado se recicla con el camino.
- Tests que valen la pena: tope de piezas, apoya en el suelo, altura pedida, 3+ tonos, nada colisionable, determinismo.

## Lecciones (medidas, no supuestas)
1. **Coherencia de estilo antes que variedad:** un árbol gigante en bloques al lado de árboles redondeados se ve de otro
   juego. Se cambió por roca. Mirar los assets que ya existen antes de elegir la forma.
2. **El lobby en ejecución puede no ser el del modo edición** (aquí se arma en redondo al iniciar). Medir en Play.
3. **Capturas útiles en Play:** fijar la cámara con `BindToRenderStep` a prioridad `Last + 5` y apagar los ScreenGui;
   una captura a la altura del jugador dice más que una aérea.
4. **Carteles viejos:** al retirarlos, llevarse también sus postes; guardarlos en un respaldo, no destruirlos.
5. Es un primer paso: siluetas simples. La escala media y el detalle se trabajan después, con el mismo método.
