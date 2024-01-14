import React, { useState } from 'react';

export default function PoorFormatting() {
  const [count, setCout] = useState(0);
  const increaseCount = () => {
    setCout(count + 1);
  };
  return <div>{count}</div>;
}
