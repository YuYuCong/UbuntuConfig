#!/usr/bin/env python3
import json
from pathlib import Path


def convert_modifiers(src_path: Path, dst_path: Path) -> None:
    """Read keybindings.json, convert ctrl→cmd and alt→option in 'key' fields, write to dst."""
    text = src_path.read_text(encoding="utf-8")

    # 先直接按标准 JSON 解析；如果失败，再尝试从第一个 '[' 到最后一个 ']' 截取。
    try:
        data = json.loads(text)
    except json.JSONDecodeError:
        start_idx = text.find("[")
        end_idx = text.rfind("]")
        if start_idx == -1 or end_idx == -1 or end_idx <= start_idx:
            raise
        json_text = text[start_idx : end_idx + 1]
        data = json.loads(json_text)

    if not isinstance(data, list):
        raise ValueError("Expected a JSON array in keybindings file")

    for item in data:
        if not isinstance(item, dict):
            continue
        key = item.get("key")
        if isinstance(key, str):
            new_key = key.replace("ctrl", "cmd").replace("alt", "option")
            item["key"] = new_key

    dst_path.write_text(
        json.dumps(data, ensure_ascii=False, indent=4),
        encoding="utf-8",
    )


def main() -> None:
    here = Path(__file__).resolve().parent
    src = here / "keybindings.json"
    dst = here / "keybindings-mac.json"

    if not src.is_file():
        raise SystemExit(f"源文件不存在: {src}")

    convert_modifiers(src, dst)
    print(f"已生成: {dst}")


if __name__ == "__main__":
    main()

