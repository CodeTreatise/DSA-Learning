const { createCanvas } = require('canvas');
const fs = require('fs');
const path = require('path');

function generateIcon(size, outputPath) {
  const canvas = createCanvas(size, size);
  const ctx = canvas.getContext('2d');
  
  // Background - gradient green
  const gradient = ctx.createLinearGradient(0, 0, size, size);
  gradient.addColorStop(0, '#2e8555');
  gradient.addColorStop(1, '#1a472a');
  ctx.fillStyle = gradient;
  
  // Rounded rectangle background
  const radius = size * 0.15;
  ctx.beginPath();
  ctx.moveTo(radius, 0);
  ctx.lineTo(size - radius, 0);
  ctx.quadraticCurveTo(size, 0, size, radius);
  ctx.lineTo(size, size - radius);
  ctx.quadraticCurveTo(size, size, size - radius, size);
  ctx.lineTo(radius, size);
  ctx.quadraticCurveTo(0, size, 0, size - radius);
  ctx.lineTo(0, radius);
  ctx.quadraticCurveTo(0, 0, radius, 0);
  ctx.fill();
  
  // DSA Text
  ctx.fillStyle = '#ffffff';
  ctx.font = `bold ${size * 0.28}px Arial, sans-serif`;
  ctx.textAlign = 'center';
  ctx.textBaseline = 'middle';
  ctx.fillText('DSA', size / 2, size * 0.38);
  
  // Decorative elements - binary tree nodes
  const nodeRadius = size * 0.05;
  ctx.fillStyle = 'rgba(255, 255, 255, 0.9)';
  
  // Root node
  const rootX = size / 2;
  const rootY = size * 0.58;
  ctx.beginPath();
  ctx.arc(rootX, rootY, nodeRadius, 0, Math.PI * 2);
  ctx.fill();
  
  // Left child
  const leftX = size * 0.35;
  const leftY = size * 0.72;
  ctx.beginPath();
  ctx.arc(leftX, leftY, nodeRadius, 0, Math.PI * 2);
  ctx.fill();
  
  // Right child
  const rightX = size * 0.65;
  const rightY = size * 0.72;
  ctx.beginPath();
  ctx.arc(rightX, rightY, nodeRadius, 0, Math.PI * 2);
  ctx.fill();
  
  // Leaf nodes
  ctx.fillStyle = 'rgba(255, 255, 255, 0.7)';
  const leafRadius = nodeRadius * 0.7;
  
  ctx.beginPath();
  ctx.arc(size * 0.25, size * 0.85, leafRadius, 0, Math.PI * 2);
  ctx.fill();
  
  ctx.beginPath();
  ctx.arc(size * 0.42, size * 0.85, leafRadius, 0, Math.PI * 2);
  ctx.fill();
  
  ctx.beginPath();
  ctx.arc(size * 0.58, size * 0.85, leafRadius, 0, Math.PI * 2);
  ctx.fill();
  
  ctx.beginPath();
  ctx.arc(size * 0.75, size * 0.85, leafRadius, 0, Math.PI * 2);
  ctx.fill();
  
  // Lines connecting nodes
  ctx.strokeStyle = 'rgba(255, 255, 255, 0.7)';
  ctx.lineWidth = size * 0.015;
  
  // Root to children
  ctx.beginPath();
  ctx.moveTo(rootX, rootY + nodeRadius);
  ctx.lineTo(leftX, leftY - nodeRadius);
  ctx.stroke();
  
  ctx.beginPath();
  ctx.moveTo(rootX, rootY + nodeRadius);
  ctx.lineTo(rightX, rightY - nodeRadius);
  ctx.stroke();
  
  // Children to leaves
  ctx.beginPath();
  ctx.moveTo(leftX, leftY + nodeRadius);
  ctx.lineTo(size * 0.25, size * 0.85 - leafRadius);
  ctx.stroke();
  
  ctx.beginPath();
  ctx.moveTo(leftX, leftY + nodeRadius);
  ctx.lineTo(size * 0.42, size * 0.85 - leafRadius);
  ctx.stroke();
  
  ctx.beginPath();
  ctx.moveTo(rightX, rightY + nodeRadius);
  ctx.lineTo(size * 0.58, size * 0.85 - leafRadius);
  ctx.stroke();
  
  ctx.beginPath();
  ctx.moveTo(rightX, rightY + nodeRadius);
  ctx.lineTo(size * 0.75, size * 0.85 - leafRadius);
  ctx.stroke();
  
  // Save to file
  const buffer = canvas.toBuffer('image/png');
  fs.writeFileSync(outputPath, buffer);
  console.log(`Generated: ${outputPath} (${size}x${size})`);
}

const imgDir = path.join(__dirname, '..', 'static', 'img');

// Generate icons
generateIcon(192, path.join(imgDir, 'icon-192.png'));
generateIcon(512, path.join(imgDir, 'icon-512.png'));

console.log('\n✅ PWA icons generated successfully!');
