---

## SYNOPSIS

**Title – “Health-Aware Forced-Outage Rates for Wind Assets: A Practical Loop from Turbine Sensors to System Adequacy”**
*(Concept paper for a CIGRE Working Group / DNV Joint-Industry Project)*

### 1 | Background & Gap

Wind-farm owners now deploy condition-monitoring (CMS) and machine-learning models that reliably forecast failures of **gearboxes** and **step-up transformers**.
Yet in **resource-adequacy tools** (e.g., Antares Simulator, PLEXOS, BID3) these same turbines are still modelled with *static* forced-outage rates (FOR) or—even worse—assumed “perfectly available unless the wind stops.”
The result:

* over-purchased capacity reserves,
* preventable redispatch costs, and
* a blind spot in ENTSO-E ERAA-style reliability studies.

### 2 | Core Idea

Create a **closed loop** in which live health indicators for the *two* components that drive the longest or most frequent outages are converted, automatically and hour-by-hour, into an updated FOR that feeds straight into the adequacy model.

```
SCADA / CMS feeds
     ↓ (normality model → P(failure 24 h))
Dynamic FOR patch (REST)  
     ↓
Nightly Antares Monte-Carlo  
     ↓
• Reserve sizing
• Curtailment order
• Capacity-market bids
```

### 3 | Why Gearbox + Transformer First

| Component   | Share of shutdown events    | Median downtime | Sensors in 3-year Fuhrländer dataset\*  | Detectable precursors         |
| ----------- | --------------------------- | --------------- | --------------------------------------- | ----------------------------- |
| Gearbox     | 22-28 %                     | 5-15 days       | Oil temp, 4× bearing temps, rotor speed | temp drift, Δσ                |
| Transformer | 3-6 % (but system-critical) | 7-30 days       | Oil & winding temps, cooler status      | hotspot rise, thermal runaway |

\*Open-access dataset gives 312 tags @ 5-min; WT84 contains an actual gearbox failure → perfect validation case.

### 4 | Novelty

* **First use of asset-specific, hour-ahead FOR for *renewables* in any CIGRE-grade study** (current standards treat RES failures as negligible).
* Leverages **open-source Antares** and **GPL-friendly REST patching**—no vendor lock-in.
* Bridges **operations (CMS)** and **planning (adequacy)** silos with a lightweight micro-service (<200 lines of code).

### 5 | Quantified Value (500 MW portfolio, EU prices)

* Avoid one additional gearbox or transformer catastrophe ➔ **€300 k – €3 M** CAPEX + downtime.
* Dynamic FOR cuts planning reserve by **0.3 % (\~1.5 MW) ➔ €90 k yr⁻¹** in UK capacity-market collateral.
* 30 % fewer surprise trips ➔ **9 GWh extra clean MWh** and lower balancing fees.
* Evidence base for CSRD reliability KPIs and future ENTSO-E FOR methodology.

### 6 | Proposed JIP Work Packages

1. **Data Harmonisation** – Map IEC 61400 SCADA tags to generic “gearbox/transformer” ontology; anonymised cross-fleet dataset.
2. **Health-Score Engine** – Open reference model (Isolation Forest / Gradient Boost) reproducible on Fuhrländer set.
3. **FOR-Patch API** – AntaREST Python micro-service; LGPL to allow commercial reuse.
4. **System-Level Trials** – Run baseline vs. dynamic-FOR on 3 real offshore and 3 onshore networks; measure ENS, LOLP, reserve.
5. **Standardisation Output** – Draft CIGRE TB chapter & DNV recommended-practice for “Health-Aware FOR”.

### 7 | Stakeholders & Roles

| Partner                                      | Contribution                                                              |
| -------------------------------------------- | ------------------------------------------------------------------------- |
| **OEMs (e.g., Siemens Gamesa)**              | Sensor semantics, failure labels, commercial CMS insight                  |
| **Asset owners (Ørsted, Iberdrola, RWE)**    | Real-world SCADA feeds, cost data                                         |
| **TSOs / DSOs (National Grid ESO, 50Hertz)** | Adequacy models, reserve-cost validation                                  |
| **DNV**                                      | Project facilitation, verification testing, recommended-practice drafting |
| **CIGRE WG**                                 | Dissemination, standard-method inclusion                                  |

### 8 | Deliverables & Timeline

* **Month 6** – Public benchmark notebook + validated fault-detection on WT84.
* **Month 12** – Antares integration demo; delta-reserve and cost report.
* **Month 18** – CIGRE paper, DNV RP draft, open-source API release.

### 9 | Call to Action

We seek **6-8 industrial partners** to supply data, review methods, and co-fund a €1.5 M Joint Industry Project.
Early adopters lock in:

* first-mover influence on the emerging standard,
* shared IP rights on the reference implementation, and
* immediate application to their own fleets.

**Contact:** \<lead-author email> for expressions of interest.

---
