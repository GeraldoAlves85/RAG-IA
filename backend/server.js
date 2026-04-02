const express = require('express');
const cors = require('cors');
const axios = require('axios');

const app = express();
const PORT = 3000;

app.use(cors());
app.use(express.json());

// Rota de saúde
app.get('/health', (req, res) => {
  res.json({ status: 'OK', ollama: 'verificando...' });
});

// Rota principal para perguntas
app.post('/ask', async (req, res) => {
  const { question } = req.body;
  
  if (!question) {
    return res.status(400).json({ error: 'Pergunta é obrigatória' });
  }

  try {
    // Chama Ollama (rodando em container separado)
    const response = await axios.post('http://ollama:11434/api/generate', {
      model: 'llama3.2',  // modelo pequeno e rápido
      prompt: question,
      stream: false
    });
    
    res.json({ 
      question: question,
      answer: response.data.response,
      model: 'llama3.2'
    });
  } catch (error) {
    console.error('Erro Ollama:', error.message);
    res.status(500).json({ 
      error: 'Erro ao processar pergunta',
      details: error.message 
    });
  }
});

app.listen(PORT, () => {
  console.log(`API rodando na porta ${PORT}`);
});
