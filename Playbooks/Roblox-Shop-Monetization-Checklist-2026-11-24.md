---
title: "Tienda y monetización en Roblox — checklist (caso Roll a Gnome, Paxton / Meta Heights)"
source: "https://www.youtube.com/watch?v=H6XPzbRKjqM (Paxton, 'Why My Roblox Game Never Hit 100,000 Players', 10:52) + capturas de la tienda de Roll a Gnome aportadas por el dueño"
updated: 2026-11-24
status: active_guidance
tags: [roblox, monetization, shop, gamepass, developer-products, boosts, ptr, ctr, retention]
---

# Tienda y monetización — lo que un juego necesita cuando el jugador va a comprar

> Resumen propio de la transcripción automática del video y de las capturas (no es transcripción literal). Cifras = las que dice el autor sobre SU juego; no son benchmarks generales.

## 1. La lección principal del video (no es la tienda)
- Roll a Gnome tenía buena retención y tiempo de juego (dice: D1 de hasta ~28 % desde recomendaciones, ~3 % D7 general, 14–20 min de sesión) pero **no llegó a 100k CCU por el PTR / CTR**: la gente no hacía clic. CTR de miniaturas ~2–2,5 % pese a probar muchas.
- Causa según el autor: **el tema (gnomos) no era "clickeable"**, sin tendencia ni videos. Contraejemplo: "Cops vs Bikers" (concepto viral conocido + miniaturas que cuentan el juego).
- **Para cualquier juego:** validar el tema y las miniaturas (CTR / PTR) ANTES de invertir en contenido; la tienda no salva un juego que nadie abre.

## 2. Diseño que vende (pre-tienda)
- **Progresión visual**: el jugador nuevo ve la parcela gigante del vecino → entiende a dónde puede llegar. Que las parcelas de otros sean visibles y espectaculares.
- **Quitar fricción con mejoras** (gratis o pagas): anillo de recolección mejorable en el árbol de mejoras — pasar y recoger todo es satisfactorio.

## 3. Capas de la tienda (estructura copiable)
| Capa | Ejemplo en Roll a Gnome | Por qué funciona |
|---|---|---|
| **Boost de servidor** (Developer Product) | "Roll Server Luck" 1x → 2x, 15 min, para TODO el servidor | Social / generoso, se compra en grupo, se repite |
| **Game passes de status + fricción** | VIP (1,5x cash, +150 % luck, chat tag), Auto Roll, Lucky Rolls, Auto Sell | Status visible + eliminar tareas repetitivas (el autor: "friction points") |
| **Micro-boosts consumibles** (Developer Product) | Pociones 3 min: 2x money, 2x luck, 4x luck, 2x growth speed (~32–56 R$) | Según el autor es donde más se gana: compra recurrente sobre "pain points" |
| **Saltar tiempo** | Carteles físicos "Skip 30 min", "Skip 12h", "Grow All Plants" | Venden progreso a quien lo quiere, sin obligar |
| **Tienda de objetos con REPOSICIÓN** | Item Shop: aspersores / regadera / fertilizante / café, stock limitado, repone cada ~5 min; se paga con moneda del juego **o** Robux; "Restock" por Robux | Ciclo de regreso cada pocos minutos + doble vía de pago |
| **Saltar rebirth** | Pagar Robux por saltar el requisito del rebirth | Para el jugador que quiere avanzar |

## 4. Checklist para cualquier tienda
- [ ] Cada producto ataca un dolor real del bucle (tiempo, suerte, inventario, recolección) — no adornos sueltos.
- [ ] Hay un camino **gratis** con la moneda del juego para casi todo (la tienda de objetos acepta las dos monedas).
- [ ] Reposición con temporizador visible ("Restocks in 00:09") → motivo para volver cada pocos minutos.
- [ ] Al menos un producto **social** (boost de servidor) con anuncio global de quién lo compró.
- [ ] Game passes = status (tag, efecto visible) + comodidad (auto-algo), nunca ventaja que rompa a los gratuitos.
- [ ] Consumibles cortos (3–15 min) y baratos para compra repetida; mostrar el tiempo restante en la HUD.
- [ ] Puntos de compra **en el mundo** (carteles, mesas) además del menú.
- [ ] Botón de regalo (🎁) en cada producto.
- [ ] Cumplimiento: suerte/odds visibles cuando un pago influye en un resultado aleatorio; `PolicyService` (`ArePaidRandomItemsRestricted`) para regiones restringidas; nunca inventar IDs/precios; recibos idempotentes y fail-closed; probar en servidor privado antes de habilitar ventas.
- [ ] Medir: CTR de miniaturas, PTR, D1/D7, tiempo de sesión, conversión, ARPPU; el autor usa estas métricas para diagnosticar.

## Ver también
- Aplicación a STOMPIES: Vault STOMPIES `08_REFERENCIAS/TIENDA_REFERENCIA_ROLL_A_GNOME_STOMPIES_2026_11_24.md`.
- [Playbooks/Superpowers-Methodology-Roblox-AI.md](Superpowers-Methodology-Roblox-AI.md) para construirlo (diseño → plan → TDD → revisión).
