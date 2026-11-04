# Interface summary

| Signal | Meaning |
|---|---|
| `event_in[3:0]` | Four synchronous event lines |
| `m_event_id[1:0]` | Selected event source |
| `m_timestamp[63:0]` | Captured local cycle count |
| `m_valid, m_ready` | Output event handshake |
| `pending_events[3:0]` | Per-source unissued status |
| `overrun_events[31:0]` | Saturation/overwrite indication counter |
| `time_counter[63:0]` | Free-running timestamp counter |

Time units are source-clock periods, not synchronized wall-clock time.
