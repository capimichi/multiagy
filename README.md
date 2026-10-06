# multiagy 🚀

**multiagy** è un gestore di profili multipli e isolati per **Antigravity CLI (`agy`)**.

Permette di gestire account Google/Antigravity multipli sullo stesso sistema macOS senza conflitti di token, senza che un account scolleghi l'altro, e prevenendo i fastidiosi popup di `SecurityAgent` (*"impossibile trovare un portachiavi..."*).

---

## ✨ Funzionalità

* **Isolamento completo dei profili**: Ciascun profilo dispone di una propria home virtuale e della propria directory dati `--gemini_dir`.
* **Keychain macOS dedicato**: Crea automaticamente un portachiavi locale vuoto con password vuota per ciascun profilo (`login.keychain-db`), eliminando definitivamente gli avvisi e i popup di sistema.
* **Standard XDG compliant**: Tutti i dati sono memorizzati in `$XDG_DATA_HOME/multiagy/profiles/` (default: `~/.local/share/multiagy/profiles/`).
* **Integrazione Git e SSH**: Condivide in automatico le chiavi SSH e le configurazioni Git della macchina host tramite collegamenti simbolici.
* **Comandi veloci**: Supporta la creazione di wrapper personalizzati (es. `agy-lavoro`) per avviare il profilo desiderato con un solo comando.

---

## 📂 Struttura delle Directory (XDG)

Ogni profilo viene strutturato come segue:

```text
~/.local/share/multiagy/profiles/<profilo>/
├── home/
│   ├── .gitconfig                         (symlink a ~/.gitconfig)
│   ├── .ssh                               (symlink a ~/.ssh)
│   └── Library/
│       └── Keychains/
│           └── login.keychain-db          (portachiavi macOS isolato)
└── gemini/                                (passato come --gemini_dir)
    ├── antigravity-cli/                   (token, sessioni, cronologia)
    └── config/                            (skills, impostazioni, progetti)
```

---

## 📦 Installazione

Clona il repository e aggiungi `multiagy` al tuo `PATH` (oppure lancia lo script di installazione):

```sh
git clone https://github.com/capimichi/multiagy.git
cd multiagy
./install.sh
```

Lo script di installazione creerà un symlink a `multiagy` in `~/.local/bin/multiagy`.

---

## 🛠️ Utilizzo

### 1. Creare un nuovo profilo
```sh
multiagy new lavoro
```
Crea la struttura directory, il portachiavi dedicato e i collegamenti per Git e SSH.

### 2. Avviare Antigravity con un profilo
Puoi avviarlo in due modi:
```sh
# Sintassi esplicita
multiagy run lavoro

# Scorciatoia diretta
multiagy lavoro

# Puoi passare qualsiasi opzione o flag supportata da agy
multiagy lavoro -c
multiagy lavoro --prompt "Spiegami questo codice"
```

Al primo avvio del profilo, `agy` ti guiderà nella schermata di login per associare quell'account specifico.

### 3. Creare un comando rapido nel sistema
Puoi creare un eseguibile dedicato nel tuo `~/.local/bin/` (es. `agy-lavoro`):
```sh
multiagy link lavoro
```
Dopodiché potrai lanciarlo ovunque semplicemente digitando:
```sh
agy-lavoro
```

### 4. Elencare i profili esistenti
```sh
multiagy list
# oppure:
multiagy ls
```

Output:
```text
Profili disponibili in ~/.local/share/multiagy/profiles:
  • lavoro           [Dimensione: 4.2M   | Login: Sì (autenticato)]
  • personale        [Dimensione: 1.1M   | Login: Sì (autenticato)]
```

### 5. Rimuovere un profilo
```sh
multiagy rm lavoro

# Per saltare la richiesta di conferma:
multiagy rm lavoro -f
```

---

## 📄 Licenza

Rilasciato sotto licenza [MIT](LICENSE).
