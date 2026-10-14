// Extrair e testar
const code = require('fs').readFileSync('index.html', 'utf8');
const scriptStart = code.indexOf('// ── CHATBOT CONTEXTUAL ──');
const scriptEnd = code.indexOf('function showTimeline(p)');
const jsCode = code.substring(scriptStart, scriptEnd);

console.log('JS code extracted:', jsCode.length, 'bytes');
console.log('Has CHAT_KB:', jsCode.includes('const CHAT_KB='));
console.log('Has tourStart:', jsCode.includes('function tourStart'));
console.log('Has chatResolve:', jsCode.includes('function chatResolve'));
console.log('\nChecking syntax...');

try {
  eval(jsCode);
  console.log('✓ JavaScript syntax valid');
  console.log('✓ CHAT_KB items:', CHAT_KB.length);
  console.log('✓ TOUR_STEPS:', TOUR_STEPS.length);
  
  // Test context
  chatCtx = {topicId: null, history: []};
  const r1 = chatResolve('O que é rollout?');
  console.log('Test 1 - "O que é rollout?":', r1?.newTopic);
  
  if (r1) chatCtx.topicId = r1.newTopic;
  const r2 = chatResolve('Qual é o teto de desconto?');
  console.log('Test 2 - "Qual é o teto de desconto?":', r2?.newTopic, '(should maintain rollout context)');
  
  if (r2?.newTopic === 'rollout') console.log('✓ Context preservation works!');
  else console.log('✗ Context not maintained');
} catch (e) {
  console.error('✗ Syntax error:', e.message);
}
